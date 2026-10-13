// Sport icon mapping.
// - New UI: `getSportVisual()` → lucide SVG component (no emoji).
// - Legacy: `sportEmoji` / `sportColor` kept for older pages still rendering emoji strings.
import type { LucideIcon } from "lucide-react";
import { Trophy, Dumbbell, Volleyball } from "lucide-react";

export interface SportVisual {
  Icon: LucideIcon;
  colorClass: string;
}

const FUTSAL: SportVisual = { Icon: Dumbbell, colorClass: "bg-blue-100 text-blue-800" };
const MINISOCCER: SportVisual = { Icon: Dumbbell, colorClass: "bg-blue-100 text-blue-700" };
const BADMINTON: SportVisual = { Icon: Volleyball, colorClass: "bg-orange-100 text-orange-700" };
const PADEL: SportVisual = { Icon: Volleyball, colorClass: "bg-sky-100 text-sky-700" };
const TENNIS: SportVisual = { Icon: Volleyball, colorClass: "bg-amber-100 text-amber-700" };
const BASKET: SportVisual = { Icon: Volleyball, colorClass: "bg-red-100 text-red-700" };
const FALLBACK: SportVisual = { Icon: Trophy, colorClass: "bg-slate-100 text-slate-600" };

const VISUALS: Record<string, SportVisual> = {
  "sport-futsal": FUTSAL,
  "sport-mini-soccer": MINISOCCER,
  "sport-bulu-tangkis": BADMINTON,
  "sport-padel": PADEL,
  "sport-tenis": TENNIS,
  "sport-basket": BASKET,
  futsal: FUTSAL,
  minisoccer: MINISOCCER,
  "mini-soccer": MINISOCCER,
  badminton: BADMINTON,
  "bulu-tangkis": BADMINTON,
  padel: PADEL,
  tenis: TENNIS,
  basket: BASKET,
};

export function getSportVisual(slugOrId: string | undefined | null): SportVisual {
  if (!slugOrId) return FALLBACK;
  return VISUALS[slugOrId] ?? FALLBACK;
}

// Legacy emoji map — phased out; migrate callers to getSportVisual().
export const sportEmoji: Record<string, string> = {
  "sport-futsal": "⚽",
  "sport-mini-soccer": "🥅",
  "sport-bulu-tangkis": "🏸",
  "sport-padel": "🎾",
  "sport-tenis": "🎾",
  "sport-basket": "🏀",
  futsal: "⚽",
  minisoccer: "🥅",
  "mini-soccer": "🥅",
  badminton: "🏸",
  "bulu-tangkis": "🏸",
  padel: "🎾",
  tenis: "🎾",
  basket: "🏀",
};

export const sportColor: Record<string, string> = Object.fromEntries(
  Object.entries(VISUALS).map(([k, v]) => [k, v.colorClass]),
);
