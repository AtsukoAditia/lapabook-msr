import { test, expect } from "@playwright/test";
import {
  loginOwner,
  ownerNav,
  shot,
  TEST_USERS,
} from "./fixtures/test-data";

// Helper: login and wait for dashboard to fully load
async function setupOwner(page: import("@playwright/test").Page) {
  await loginOwner(page);
}

test.describe("Owner Flow — Full Dashboard", () => {

  // ─── Login ───

  test("1. owner can login", async ({ page }) => {
    await setupOwner(page);
    await expect(page).toHaveURL(/\/dashboard/);
    await expect(page.locator("h1:has-text('Dashboard')").first()).toBeVisible();
    await shot(page, "owner-01-dashboard-home");
  });

  // ─── Dashboard Home ───

  test("2. dashboard shows stats cards", async ({ page }) => {
    await setupOwner(page);
    await expect(page.locator("text=Total Booking")).toBeVisible();
    await expect(page.locator("text=Total Lapangan")).toBeVisible();
    await shot(page, "owner-02-dashboard-stats");
  });

  // ─── Bookings ───

  test("3. bookings page loads with data", async ({ page }) => {
    await setupOwner(page);
    await ownerNav(page, "bookings");
    await expect(page.locator("h1:has-text('Booking')")).toBeVisible();
    await expect(page.locator("text=Menunggu").first()).toBeVisible();
    await shot(page, "owner-03-bookings");
  });

  test("4. bookings status filter works", async ({ page }) => {
    await setupOwner(page);
    await ownerNav(page, "bookings");
    await page.locator("select").last().selectOption("confirmed");
    await page.waitForTimeout(1_500);
    await shot(page, "owner-04-bookings-filter");
  });

  test("5. bookings search works", async ({ page }) => {
    await setupOwner(page);
    await ownerNav(page, "bookings");
    await page.locator('input[placeholder*="Cari"]').fill("Bob");
    await page.waitForTimeout(1_500);
    await expect(page.locator("text=Bob Wilson")).toBeVisible();
    await shot(page, "owner-05-bookings-search");
  });

  // ─── Courts ───

  test("6. courts page loads with data", async ({ page }) => {
    await setupOwner(page);
    await ownerNav(page, "courts");
    await expect(page.locator("h1:has-text('Lapangan')")).toBeVisible();
    await expect(page.locator("text=Futsal Court 1")).toBeVisible();
    await shot(page, "owner-06-courts");
  });

  test("7. courts filter by sport works", async ({ page }) => {
    await setupOwner(page);
    await ownerNav(page, "courts");
    await page.locator("select").last().selectOption("sport-futsal");
    await page.waitForTimeout(1_500);
    await expect(page.locator("text=Futsal Court 2")).toBeVisible();
    await shot(page, "owner-07-courts-filter-sport");
  });

  // ─── Venues ───

  test("8. venues page loads", async ({ page }) => {
    await setupOwner(page);
    await ownerNav(page, "venues");
    await expect(page.locator("h1:has-text('Venue Saya')")).toBeVisible();
    await expect(page.locator("text=Greenfield Sports Club")).toBeVisible();
    await shot(page, "owner-08-venues");
  });

  // ─── Analytics ───

  test("9. analytics page loads with charts", async ({ page }) => {
    await setupOwner(page);
    await ownerNav(page, "analytics");
    await expect(page.locator("h1:has-text('Analytics')")).toBeVisible();
    await expect(page.locator("text=Bulan Ini")).toBeVisible();
    await shot(page, "owner-09-analytics");
  });

  // ─── Settings ───

  test("10. settings redirects to pricing", async ({ page }) => {
    await setupOwner(page);
    await ownerNav(page, "settings");
    await expect(page).toHaveURL(/pricing/);
    await shot(page, "owner-10-settings");
  });

  // ─── Pricing ───

  test("11. pricing page loads", async ({ page }) => {
    await setupOwner(page);
    await ownerNav(page, "settings/pricing");
    await expect(page.locator("body")).toBeVisible();
    await shot(page, "owner-11-pricing");
  });

  // ─── Rain Discount ───

  test("12. rain config page loads", async ({ page }) => {
    await setupOwner(page);
    await ownerNav(page, "settings/rain");
    await expect(page.locator("body")).toBeVisible();
    await shot(page, "owner-12-rain-config");
  });

  // ─── Logout ───

  test("13. owner can logout", async ({ page }) => {
    await setupOwner(page);
    // Click logout button
    await page.locator('button[title="Logout"]').click();
    await page.waitForURL("**/login", { timeout: 10_000 });
    await expect(page).toHaveURL(/\/login/);
    await shot(page, "owner-13-logout");
  });
});
