import assert from "node:assert/strict";

// Light self-check for Group Booking logic (no DB, pure business rules)

function validateCreate(input: { minP: number; maxP: number; slots: number }) {
  if (input.minP < 2) throw new Error("min < 2");
  if (input.maxP < input.minP) throw new Error("max < min");
  if (input.slots < 1) throw new Error("need slot");
}

function calcAcceptThreshold(participants: { status: string }[], min: number) {
  const accepted = participants.filter((p) => p.status === "accepted").length;
  return accepted >= min;
}

function pickWinner(slots: { id: string; voteCount: number }[]) {
  if (!slots.length) throw new Error("no slots");
  return [...slots].sort((a, b) => b.voteCount - a.voteCount)[0];
}

function calcSplit(total: number, count: number) {
  if (count <= 0) throw new Error("count <=0");
  return total / count;
}

// Tests
try {
  // validation
  validateCreate({ minP: 4, maxP: 10, slots: 2 });

  let threw = false;
  try { validateCreate({ minP: 1, maxP: 10, slots: 1 }); } catch { threw = true; }
  assert.equal(threw, true, "should throw min");

  threw = false;
  try { validateCreate({ minP: 5, maxP: 3, slots: 1 }); } catch { threw = true; }
  assert.equal(threw, true, "should throw max < min");

  // threshold
  const parts = [
    { status: "accepted" },
    { status: "accepted" },
    { status: "invited" },
    { status: "declined" },
  ];
  assert.equal(calcAcceptThreshold(parts, 2), true);
  assert.equal(calcAcceptThreshold(parts, 3), false);

  // voting
  const slots = [
    { id: "a", voteCount: 1 },
    { id: "b", voteCount: 5 },
    { id: "c", voteCount: 2 },
  ];
  const winner = pickWinner(slots);
  assert.equal(winner.id, "b");

  // split
  assert.equal(calcSplit(100000, 4), 25000);
  assert.equal(calcSplit(150000, 3), 50000);

  // re-vote logic: old vote decremented to 0 floor
  function dec(old: number) { return Math.max(old - 1, 0); }
  assert.equal(dec(1), 0);
  assert.equal(dec(0), 0);

  console.log("✅ Group booking self-check passed (validation, threshold, voting, split)");
} catch (e) {
  console.error("❌ Self-check failed:", e);
  process.exit(1);
}
