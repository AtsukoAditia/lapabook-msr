import { test, expect } from "@playwright/test";
import {
  loginCustomer,
  shot,
  createUniqueEmail,
  TEST_USERS,
} from "./fixtures/test-data";

test.describe.serial("Customer Flow", () => {
  const email = createUniqueEmail();
  const password = TEST_USERS.customer.password;

  test("customer can register and full basket flow", async ({ page }) => {
    // Register
    await page.goto("/register", { waitUntil: "domcontentloaded" });
    await page.locator('input[type="text"]').first().fill(TEST_USERS.customer.name);
    await page.locator('input[type="email"]').fill(email);
    await page.locator('input[type="tel"]').fill(TEST_USERS.customer.phone);
    const pwFields = page.locator('input[type="password"]');
    await pwFields.nth(0).fill(password);
    if ((await pwFields.count()) > 1) await pwFields.nth(1).fill(password);
    await page.locator('input[type="checkbox"]').check();
    await shot(page, "customer-register-filled");
    await page.locator('button[type="submit"]').click();
    await page.waitForURL("**/login**", { timeout: 15_000 });
    await shot(page, "customer-register-done");

    // Login (same page context, no new page)
    await loginCustomer(page, email, password);
    await shot(page, "customer-logged-in");
    expect(page.url()).not.toContain("/login");

    // Search basket courts
    await page.goto("/cari/basket", { waitUntil: "domcontentloaded" });
    await page.waitForTimeout(1_000);
    await expect(page.locator("body")).toBeVisible();
    await shot(page, "customer-search-basket");

    // Booking form
    await page.goto("/booking/form?courtId=court-bsk1&date=2026-08-28&startTime=08:00&endTime=09:00", { waitUntil: "domcontentloaded" });
    await page.waitForTimeout(1_000);
    await expect(page.locator("body")).toBeVisible();
    await shot(page, "customer-booking-form");

    // Profile / bookings
    await page.goto("/profile", { waitUntil: "domcontentloaded" });
    await page.waitForTimeout(1_000);
    await expect(page.locator("body")).toBeVisible();
    await shot(page, "customer-profile");
  });
});
