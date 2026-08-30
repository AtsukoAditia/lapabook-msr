import { RateLimiterMemory } from "rate-limiter-flexible";

// Flag: disable rate limiter when running tests or in dev mode
export const IS_TESTING_ENV =
  process.env.NODE_ENV === 'test' || process.env.IS_TESTING === 'true';

// Login rate limiter — generous in testing, strict in prod
export const loginLimiter = new RateLimiterMemory({
  points: IS_TESTING_ENV ? 10000 : 5,
  duration: IS_TESTING_ENV ? 60 * 60 : 900, // 1h vs 15m
  keyPrefix: "login",
});

// API rate limiter — generous in testing, strict in prod
export const apiLimiter = new RateLimiterMemory({
  points: IS_TESTING_ENV ? 100000 : 100,
  duration: 60,
  keyPrefix: "api",
});

// Booking rate limiter — generous in testing, strict in prod
export const bookingLimiter = new RateLimiterMemory({
  points: IS_TESTING_ENV ? 10000 : 10,
  duration: IS_TESTING_ENV ? 3600 : 3600,
  keyPrefix: "booking",
});

export function getClientIP(request: Request): string {
  return (
    request.headers.get("x-forwarded-for")?.split(",")[0]?.trim() ||
    request.headers.get("x-real-ip") ||
    "unknown"
  );
}

// Helper: check rate limit, returns null if OK, 429 response if exceeded
export async function checkRateLimit(
  limiter: RateLimiterMemory,
  key: string
): Promise<{ limited: true; retryAfter: number } | null> {
  if (IS_TESTING_ENV) return null;
  try {
    await limiter.consume(key);
    return null; // allowed
  } catch (rateLimiterRes) {
    const retryAfter = Math.ceil(
      (rateLimiterRes as { msBeforeNext: number }).msBeforeNext / 1000
    );
    return { limited: true, retryAfter };
  }
}
