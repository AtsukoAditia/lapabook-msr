# Graph Report - lapangin-msr  (2026-10-06)

## Corpus Check
- cluster-only mode — file stats not available

## Summary
- 4417 nodes · 10764 edges · 179 communities (143 shown, 36 thin omitted)
- Extraction: 98% EXTRACTED · 2% INFERRED · 0% AMBIGUOUS · INFERRED: 174 edges (avg confidence: 0.85)
- Token cost: 0 input · 0 output

## Graph Freshness
- Built from commit: `6eb77e37`
- Run `git rev-parse HEAD` and compare to check if the graph is stale.
- Run `graphify update .` after code changes (no API cost).

## Community Hubs (Navigation)
- live-browser.js
- PostgresAdapter
- verifyToken
- domain.ts
- checks.mjs
- GoogleSheetsAdapter
- DatabaseAdapter
- getDatabaseAdapter
- MockAdapter
- next
- index.mjs
- Booking
- context.mjs
- checkRateLimit
- setLiveState
- AdminLayout
- snakeToCamel
- resumeSession
- modern-screenshot.umd.js
- design-system.mjs
- hook-lib.mjs
- postgres/schema.sql
- manual-apply.mjs
- live-commit-manual-edits.mjs
- el
- syncPageChatFocus
- live-server.mjs
- impeccable-config.mjs
- initGlobalBar
- live-inject.mjs
- hook-admin.mjs
- react
- hook-before-edit.mjs
- svelte-component.mjs
- detect-antipatterns-browser.js
- detect-antipatterns.mjs
- insert-ui.mjs
- src_lib_auth_jwt_customer_token_name
- detect-text.mjs
- css-cascade.mjs
- live-wrap.mjs
- design-parser.mjs
- session-store.mjs
- notification-service.ts
- live-accept.mjs
- live-copy-edit-agent.mjs
- package.json
- parseRgb
- admin/analytics/page.tsx
- pickup_games
- runHook
- live-poll.mjs
- detect-html.mjs
- manual-edits-buffer.mjs
- live-manual-edit-evidence.mjs
- test-data.ts
- ref_node_path
- LoyaltyTransaction
- handleGo
- generate-spreadsheet.ts
- success/page.tsx
- supabase/schema.sql
- payment-service.ts
- impeccable-paths.mjs
- captureElementToBlob
- PricingRule
- src_lib_auth_jwt_admin_token_name
- booking/page.tsx
- live.mjs
- parseAnyColor
- dependencies
- app/layout.tsx
- compilerOptions
- critique-storage.mjs
- resolveLengthPx
- Court
- 010_team_wallet.sql
- context-signals.mjs
- refreshParamsPanel
- onAnnotDown
- createLiveBrowserSessionState
- SlotSelector.tsx
- GroupBookingTimeSlot
- checkElementDesignSystemDOM
- collectBrowserFindings
- renderTemplate
- manifest.json
- ref_fs
- group_bookings
- sampleCssBackground
- createLiveBrowserDomHelpers
- devDependencies
- Sport
- StaticElement
- doctor.ts
- BookingService
- OwnerPricingPage
- booking/[sport]/page.tsx
- BlockedSlot
- service.ts
- scheduleLazyVisualContrast
- pin.mjs
- rain-check/route.ts
- TeamWallet
- 014_player_achievements.sql
- palette.mjs
- @sentry/nextjs
- detect-csp.mjs
- group-booking-validator.ts
- admin/bookings/page.tsx
- form/page.tsx
- profile/page.tsx
- Achievement
- middleware.ts
- flash_deals
- syncEditBadgeHitProxies
- ui-core.mjs
- recurring/page.tsx
- TeamWalletDeposit
- TeamWalletTransaction
- VenueVerification
- Reward
- PickupGameMessage
- PlayerProfile
- venue_verifications
- scripts
- rain/page.tsx
- new/page.tsx
- AuditLogEntry
- support_conversations
- isScreenReaderOnlyTextStyle
- fcm-service.ts
- NotificationsPage
- bookings/[id]/page.tsx
- tentang/page.tsx
- i18n.ts
- venue_cameras
- isGeneratedFile
- owner/venues/route.ts
- [courtId]/page.tsx
- cari/[sport]/page.tsx
- kebijakan/page.tsx
- profile/bookings/page.tsx
- ReferralPage
- admin/page.tsx
- cms/route.ts
- payments/[id]/route.ts
- dashboard/courts/page.tsx
- photos/[id]/page.tsx
- invoice/[id]/page.tsx
- gamification/page.tsx
- context.tsx
- customer_favorites
- applyDeferredSvelteComponentAccepts
- sw.js
- AdminPricingPage
- gamification/achievements/route.ts
- dashboard/layout.tsx
- profile/reviews/page.tsx
- syarat/page.tsx
- holidays.sql
- court_photos
- notification_preferences
- bookings_recurring_idx
- 018_loyalty_tiers.sql
- reset-cache.sh
- app.ts

## God Nodes (most connected - your core abstractions)
1. `PostgresAdapter` - 189 edges
2. `DatabaseAdapter` - 178 edges
3. `GoogleSheetsAdapter` - 169 edges
4. `MockAdapter` - 167 edges
5. `next` - 164 edges
6. `verifyToken()` - 158 edges
7. `getDatabaseAdapter()` - 132 edges
8. `query()` - 99 edges
9. `Booking` - 73 edges
10. `react` - 71 edges

## Surprising Connections (you probably didn't know these)
- `ne()` --indirect_call--> `t()`  [INFERRED]
  .github/skills/impeccable/scripts/modern-screenshot.umd.js → src/config/i18n.ts
- `AreaSelectProps` --references--> `Area`  [EXTRACTED]
  src/components/booking/AreaSelect.tsx → src/lib/types/domain.ts
- `layoutFlowChildren()` --indirect_call--> `pickable()`  [INFERRED]
  .github/skills/impeccable/scripts/live-browser.js → .github/skills/impeccable/scripts/live-browser-dom.js
- `POST()` --calls--> `verifyToken()`  [EXTRACTED]
  src/app/api/flash-deals/route.ts → src/lib/auth/jwt.ts
- `POST()` --calls--> `verifyToken()`  [EXTRACTED]
  src/app/api/pickup-games/[id]/messages/route.ts → src/lib/auth/jwt.ts

## Import Cycles
- None detected.

## Communities (179 total, 36 thin omitted)

### Community 0 - "live-browser.js"
Cohesion: 0.03
Nodes (135): acceptedDomAlreadyClean(), addManualContextText(), applyGlobalBarLabelState(), applyPlaceholderSizingStyles(), applySvelteComponentVariantStyle(), bufferToBase64(), buildCollapsible(), buildColorModels() (+127 more)

### Community 2 - "verifyToken"
Cohesion: 0.03
Nodes (75): GET(), globalForPg, GET(), GET(), globalForPg, POST(), GET(), globalForPg (+67 more)

### Community 3 - "domain.ts"
Cohesion: 0.02
Nodes (35): g, generateBookingCode(), getCourtBySlug(), getVenueBySlug(), mockAreas, mockCourts, mockPricingRules, mockVenueOwners (+27 more)

### Community 4 - "checks.mjs"
Cohesion: 0.04
Nodes (105): borderColorsFromStyle(), borderWidthsFromStyle(), checkBorders(), checkClippedOverflow(), checkColors(), checkCreamPalette(), checkElementAIPaletteDOM(), checkElementBorders() (+97 more)

### Community 5 - "GoogleSheetsAdapter"
Cohesion: 0.03
Nodes (15): getJwtClient(), getSpreadsheet(), GoogleSheetsAdapter, rowToAuditLog(), rowToBlockedSlot(), rowToBooking(), rowToCourt(), rowToPricingRule() (+7 more)

### Community 6 - "DatabaseAdapter"
Cohesion: 0.03
Nodes (7): DatabaseAdapter, mapRow(), Area, GroupBookingParticipant, TeamWalletMember, Venue, VenueCamera

### Community 7 - "getDatabaseAdapter"
Cohesion: 0.05
Nodes (52): GET(), PATCH(), POINTS_EARNING_STATUSES, VALID_STATUSES, GET(), GET(), PATCH(), GET() (+44 more)

### Community 8 - "MockAdapter"
Cohesion: 0.03
Nodes (10): generateId(), getCustomers(), getLoyalty(), getRedemptions(), MockAdapter, FlashDeal, GroupBooking, MatchRequest (+2 more)

### Community 9 - "next"
Cohesion: 0.03
Nodes (28): nextConfig, next, pg, globalForPg, globalForPg, globalForPg, globalForPg, globalForPg (+20 more)

### Community 10 - "index.mjs"
Cohesion: 0.06
Nodes (68): addBrowserFindings(), addVisualContrastFindings(), addVisualContrastResult(), analyzeVisualContrast(), analyzeVisualContrastCandidate(), blendRgba(), browserColorsClose(), browserDesignSystemConfig() (+60 more)

### Community 11 - "Booking"
Cohesion: 0.06
Nodes (18): CreateBookingInput, mapBooking(), ACTIVE_STATUSES, AvailableSlotsInput, hasBlockedSlotConflict(), hasBookingConflict(), minutesToTime(), TimeSlot (+10 more)

### Community 12 - "context.mjs"
Cohesion: 0.07
Nodes (65): buildMissingTargetDirective(), buildResolvedContextDirective(), buildTargetSelectionDirective(), buildUpdateDirective(), cli(), compareSemver(), computeUpdateDirective(), contextSourcePath() (+57 more)

### Community 13 - "checkRateLimit"
Cohesion: 0.09
Nodes (46): formatDate(), formatPrice(), generateBookingConfirmMessage(), generateRatingMessage(), generateReminderMessage(), globalForPg, POST(), POST() (+38 more)

### Community 14 - "setLiveState"
Cohesion: 0.10
Nodes (63): abortSvelteComponentInjection(), applyEditing(), cancelEditing(), cancelEditingToPicking(), cancelInsertConfigure(), cleanup(), cleanupAcceptedSession(), clearAnnotations() (+55 more)

### Community 15 - "AdminLayout"
Cohesion: 0.04
Nodes (32): AdminCmsPage(), AVAILABLE_PAGES, CmsPage, CommissionData, CommissionPage(), CommissionVenue, fmt(), AdminCourtsPage() (+24 more)

### Community 16 - "snakeToCamel"
Cohesion: 0.05
Nodes (8): getAdmins(), fmtTs(), snakeToCamel(), AdminUser, CustomerPublic, PaymentMethod, VenueOwner, VenueOwnerStatus

### Community 17 - "resumeSession"
Cohesion: 0.08
Nodes (59): applyOriginalAttrsToSvelteAnchor(), applyPlaceholderDimensions(), applySavedSessionMeta(), clampVariantIndex(), clearHandled(), commitAcceptedSvelteComponentToDom(), dismissToast(), elementMatchesOriginalMarkup() (+51 more)

### Community 18 - "modern-screenshot.umd.js"
Cohesion: 0.09
Nodes (55): ae(), be(), bt(), Ce(), s(), Ct(), de(), dt() (+47 more)

### Community 19 - "design-system.mjs"
Cohesion: 0.08
Nodes (54): addColorObject(), addDesignColor(), addRoundedScale(), addRoundedToken(), addSidecarColors(), addSidecarRadii(), addTypographyFonts(), addTypographySizes() (+46 more)

### Community 20 - "hook-lib.mjs"
Cohesion: 0.07
Nodes (52): ACK_EXTS, applyConfigSource(), applyDetectorConfigSource(), applyPatchText(), clampByte(), cloneDefaultConfig(), CO_SCAN_STYLE_NAMES, colorIgnoreKey() (+44 more)

### Community 21 - "postgres/schema.sql"
Cohesion: 0.08
Nodes (51): admins, audit_logs, blocked_slots, bookings, bookings_code_idx, bookings_court_date_idx, bookings_customer_idx, bookings_expires_idx (+43 more)

### Community 22 - "manual-apply.mjs"
Cohesion: 0.09
Nodes (48): addOpToManualApplyChunk(), APPLY_EVENT_HARD_TIMEOUT_MS, APPLY_EVENT_SOFT_DEADLINE_MS, buildManualApplyAgentAction(), clearManualApplyTransaction(), collectManualApplyFiles(), compactManualApplyBatch(), compactManualApplyCandidates() (+40 more)

### Community 23 - "live-commit-manual-edits.mjs"
Cohesion: 0.10
Nodes (49): allEntryIds(), argVal(), buildRepairBatch(), candidatesForEntry(), changedFilesSinceSnapshot(), clearAppliedEntries(), collectApplyOwnedFiles(), collectRollbackFiles() (+41 more)

### Community 24 - "el"
Cohesion: 0.08
Nodes (49): actionLabel(), applyConfigureBarChrome(), bindConfigureCountPillTooltip(), bindConfigureInlineControlHover(), bindConfigureModifierPillHover(), buildConfigureActionControl(), buildConfigureCountControl(), buildConfigureRow() (+41 more)

### Community 25 - "syncPageChatFocus"
Cohesion: 0.09
Nodes (49): armPageChatForTyping(), attachSteerFocusDebug(), attachSteerFocusGuard(), clearSteerAwaitTimer(), clearSteerFocusRecoverTimer(), collapsePageChat(), expandPageChat(), finishVoiceSession() (+41 more)

### Community 26 - "live-server.mjs"
Cohesion: 0.09
Nodes (45): assembleLiveBrowserScript(), assertLiveBrowserScriptParts(), LIVE_BROWSER_SCRIPT_PARTS, readLiveBrowserScriptParts(), resolveLiveBrowserScriptParts(), acknowledgePendingEvent(), activeSessionSummaries(), agentPollingConnected() (+37 more)

### Community 27 - "impeccable-config.mjs"
Cohesion: 0.10
Nodes (47): applyDetectionConfigSource(), clampByte(), cleanIgnoreValueDisplay(), cloneDetectionConfig(), cloneRawDetectionConfig(), colorIgnoreKey(), DEFAULT_DETECTION_CONFIG, DETECTOR_CONFIG_KEYS (+39 more)

### Community 28 - "initGlobalBar"
Cohesion: 0.09
Nodes (46): barPaletteForTheme(), brandMarkSvg(), buildSteerProcessingDots(), clearStoredManualApplyState(), designPanelCss(), detectPageTheme(), ensureAgentPollTooltip(), fetchPendingCount() (+38 more)

### Community 29 - "live-inject.mjs"
Cohesion: 0.09
Nodes (43): appendOriginToDirective(), buildTagBlock(), commentClose(), commentOpen(), CONFIG_PATH, detectLineEnding(), __dirname, ensureLiveGitIgnores() (+35 more)

### Community 30 - "hook-admin.mjs"
Cohesion: 0.12
Nodes (42): ACTIONS, addIgnoreFile(), addIgnoreRule(), addIgnoreValue(), DETECTOR_CONFIG_KEYS, detectorSection(), fileHasImpeccableHookMarker(), HOOK_MANIFEST_TARGETS (+34 more)

### Community 31 - "react"
Cohesion: 0.05
Nodes (14): react, Conversation, Message, Booking, STATUS_CONFIG, OwnerDashboard(), OwnerStats, STATUS_CONFIG (+6 more)

### Community 32 - "hook-before-edit.mjs"
Cohesion: 0.10
Nodes (41): allow(), bumpCursorDenial(), deny(), detectProposedHtml(), done(), escapeRegExp(), findingSignature(), firstMatch() (+33 more)

### Community 33 - "svelte-component.mjs"
Cohesion: 0.10
Nodes (42): appendCssToSvelteStyle(), appendSanitizedCssRule(), bakeParamValuesInCss(), buildInsertVariantStub(), buildPropContract(), buildPropsScript(), buildVariantStub(), componentSessionDir() (+34 more)

### Community 34 - "detect-antipatterns-browser.js"
Cohesion: 0.08
Nodes (37): checkBorders(), checkClippedOverflow(), checkElementBorders(), checkElementBordersDOM(), checkElementClippedOverflow(), checkElementClippedOverflowDOM(), checkElementItalicSerif(), checkElementItalicSerifDOM() (+29 more)

### Community 35 - "detect-antipatterns.mjs"
Cohesion: 0.10
Nodes (33): confirm(), detectCli(), formatFindings(), formatFindingSummary(), handleStdin(), printUsage(), createBrowserDetector(), buildImportGraph() (+25 more)

### Community 36 - "insert-ui.mjs"
Cohesion: 0.07
Nodes (25): FORBIDDEN_MANUAL_EDIT_TEXT_CHARS, INSERT_POSITIONS, isValidId(), isValidVariantId(), validateAnnotationFields(), validateEvent(), validateInsertGenerate(), validateManualEditEvent() (+17 more)

### Community 37 - "src_lib_auth_jwt_customer_token_name"
Cohesion: 0.12
Nodes (14): globalForPg, POST(), POST(), POST(), DELETE(), GET(), GET(), POST() (+6 more)

### Community 38 - "detect-text.mjs"
Cohesion: 0.09
Nodes (29): CSS_IN_JS_EXTENSIONS, detectText(), extFromFilePath(), extractCSSinJS(), extractStyleBlocks(), firstOverusedGoogleFont(), isNeutralBorderColor(), PAGE_ANALYZER_EXTS (+21 more)

### Community 39 - "css-cascade.mjs"
Cohesion: 0.11
Nodes (34): applyStaticDeclaration(), buildBorderOverrideMap(), parseShorthand(), resolveVar(), buildStaticStyleMap(), collectStaticCssRules(), collectStaticCssText(), compareStaticPriority() (+26 more)

### Community 40 - "live-wrap.mjs"
Cohesion: 0.14
Nodes (34): argVal(), buildInsertWrapperLines(), computeInsertLine(), INSERT_POSITIONS, insertCli(), isInsertPosition(), resolveElementMatch(), buildSvelteComponentCssAuthoring() (+26 more)

### Community 41 - "design-parser.mjs"
Cohesion: 0.15
Nodes (33): buildColor(), CANONICAL_SECTIONS, collectBullets(), collectColorValues(), collectParagraphs(), detectFormat(), extractColors(), extractComponents() (+25 more)

### Community 42 - "session-store.mjs"
Cohesion: 0.12
Nodes (28): isLiveServerPidReachable(), readLiveServerInfo(), completeCli(), completeThroughServer(), parseArgs(), readServerInfo(), collectManualApplyFiles(), manualApplyReplyCommand() (+20 more)

### Community 43 - "notification-service.ts"
Cohesion: 0.11
Nodes (27): GET(), PATCH(), globalForPg, POST(), getNotificationTemplate(), TemplateResult, templates, TemplateVars (+19 more)

### Community 44 - "live-accept.mjs"
Cohesion: 0.14
Nodes (32): acceptCli(), argVal(), buildCarbonizeReplacement(), decodeHtmlAttr(), deindentContent(), detectCommentSyntax(), escapeRegExp(), expandReplaceRange() (+24 more)

### Community 45 - "live-copy-edit-agent.mjs"
Cohesion: 0.13
Nodes (31): applyMockWrites(), buildCopyEditBatchPrompt(), checkFrameworkSourceSyntax(), chooseCopyEditAgent(), COMMAND_AUTH_CACHE, commandAuthed(), commandExists(), compactBatchForPrompt() (+23 more)

### Community 46 - "package.json"
Cohesion: 0.07
Nodes (28): name, private, version, autoprefixer, bcryptjs, clsx, date-fns, eslint (+20 more)

### Community 47 - "parseRgb"
Cohesion: 0.13
Nodes (31): analyzeVisualContrast(), analyzeVisualContrastCandidate(), checkColors(), checkElementAIPaletteDOM(), checkElementColors(), checkElementColorsDOM(), checkElementGlow(), checkElementGlowDOM() (+23 more)

### Community 48 - "admin/analytics/page.tsx"
Cohesion: 0.09
Nodes (25): AnalyticsPage(), formatDate(), formatPrice(), RevenueData, AnalyticsData, formatPrice(), OwnerAnalyticsPage(), RecentBooking (+17 more)

### Community 49 - "pickup_games"
Cohesion: 0.11
Nodes (22): idx_pickup_games_location, idx_pickup_games_scheduled, idx_pickup_games_sport, idx_pickup_games_status, idx_pickup_messages_created, idx_pickup_messages_game, idx_pickup_participants_customer, idx_pickup_participants_game (+14 more)

### Community 50 - "runHook"
Cohesion: 0.11
Nodes (28): bumpEditCount(), coLocatedStylesheets(), dedupeAgainstCache(), depthIsSet(), ensureFile(), ensureSession(), expandScanTargets(), findingCacheKey() (+20 more)

### Community 51 - "live-poll.mjs"
Cohesion: 0.15
Nodes (26): completionAckForAcceptResult(), completionTypeForAcceptResult(), augmentEventWithAcceptHandling(), buildAcceptScriptArgs(), buildPollReplyPayload(), DEFAULT_EVENT_LEASE_MS, EVENT_TYPES_NEEDING_AGENT_REPLY, fetchNextEvent() (+18 more)

### Community 52 - "detect-html.mjs"
Cohesion: 0.11
Nodes (9): buildStaticWindow(), StaticDocument, checkStaticPageTypography(), detectHtml(), STATIC_ELEMENT_RULES, checkElementGlow(), checkHtmlPatterns(), checkPageQualityDOM() (+1 more)

### Community 53 - "manual-edits-buffer.mjs"
Cohesion: 0.19
Nodes (23): args, buffer, cwd, pageUrlFilter, remaining, compactManualLogText(), rollbackManualApplyTransaction(), summarizeManualApplyFailures() (+15 more)

### Community 54 - "live-manual-edit-evidence.mjs"
Cohesion: 0.15
Nodes (25): analyzeSourceHint(), buildCandidatesForOp(), buildContextHintsByRef(), collectSearchFiles(), countOps(), decodeBasicHtml(), escapeRegExp(), findContextMatches() (+17 more)

### Community 55 - "test-data.ts"
Cohesion: 0.13
Nodes (12): ADMIN_SECRET, adminNav(), createUniqueEmail(), loginAdmin(), loginCustomer(), loginOwner(), ownerNav(), shot() (+4 more)

### Community 56 - "ref_node_path"
Cohesion: 0.15
Nodes (17): detectUrl(), runVisualContrastFallback(), serializeDesignSystemForBrowser(), captureVisualContrastCandidate(), compareScreenshotContrast(), sanitizeScreenshotClip(), finding(), getAP() (+9 more)

### Community 57 - "LoyaltyTransaction"
Cohesion: 0.13
Nodes (4): LoyaltyService, LoyaltyTransaction, LoyaltyTransactionType, RewardRedemption

### Community 58 - "handleGo"
Cohesion: 0.11
Nodes (23): buildInsertPlaceholderSnapshotFromDom(), buildPickedAnchorSnapshot(), captureAndEmit(), checkpointPayload(), collectEditableTextRows(), visit(), copyEditContainerContext(), copyEditLeafContext() (+15 more)

### Community 59 - "generate-spreadsheet.ts"
Cohesion: 0.08
Nodes (21): google-spreadsheet, now, SEED_ACTIVITY_LOGS, SEED_ADMIN_USERS, SEED_AREAS, SEED_AUDIT_LOG, SEED_BLOCKED_SLOTS, SEED_BOOKINGS (+13 more)

### Community 60 - "success/page.tsx"
Cohesion: 0.13
Nodes (14): BookingSuccessPage(), formatCountdown(), getHeader(), getStatusCard(), POLLABLE_STATUSES, PublicBooking, SuccessContent(), ReviewForm() (+6 more)

### Community 61 - "supabase/schema.sql"
Cohesion: 0.18
Nodes (22): admins, areas, audit_logs, blocked_slots, blocked_slots_court_date_idx, bookings, bookings_code_idx, bookings_court_date_idx (+14 more)

### Community 62 - "payment-service.ts"
Cohesion: 0.11
Nodes (7): paymentService, paymentService, PAYMENT_CONFIG, getSnapClient(), MidtransNotification, PaymentService, SnapTokenResult

### Community 63 - "impeccable-paths.mjs"
Cohesion: 0.17
Nodes (21): resolveProjectRoot(), CRITIQUE_DIR, firstExisting(), getDesignSidecarCandidates(), getDesignSidecarPath(), getImpeccableDir(), getLegacyLiveAnnotationsDir(), getLegacyLiveConfigPath() (+13 more)

### Community 64 - "captureElementToBlob"
Cohesion: 0.12
Nodes (20): averageRgb01(), captureChromeNodes(), captureElementFromRenderedAncestor(), captureElementToBlob(), compileShader(), cssColorToRgb01(), dominantRgb01(), findBackdropAncestor() (+12 more)

### Community 65 - "PricingRule"
Cohesion: 0.14
Nodes (5): CreatePricingRuleInput, UpdatePricingRuleInput, mapPricing(), PricingService, PricingRule

### Community 66 - "src_lib_auth_jwt_admin_token_name"
Cohesion: 0.13
Nodes (12): getAdminSession(), PATCH(), GET(), getAdminSession(), GET(), globalForPg, POST(), requireAdmin() (+4 more)

### Community 67 - "booking/page.tsx"
Cohesion: 0.17
Nodes (10): CANONICAL_SLUGS, HomePage(), BookingContent(), BookingIndexPage(), AreaSelect(), AreaSelectProps, useScrollReveal(), useStaggerReveal() (+2 more)

### Community 68 - "live.mjs"
Cohesion: 0.19
Nodes (15): loadContext(), parseCliOptions(), safeRead(), parseTargetOptions(), parseTargetPath(), TargetArgError, __dirname, ensureServerRunning() (+7 more)

### Community 69 - "parseAnyColor"
Cohesion: 0.15
Nodes (19): borderColorsFromStyle(), borderWidthsFromStyle(), checkElementGptBorderShadow(), checkElementGptBorderShadowDOM(), checkElementQualityDOM(), checkGptThinBorderWideShadow(), checkQuality(), colorsNearlyMatch() (+11 more)

### Community 70 - "dependencies"
Cohesion: 0.11
Nodes (19): dependencies, bcryptjs, clsx, date-fns, framer-motion, google-auth-library, google-spreadsheet, googleapis (+11 more)

### Community 71 - "app/layout.tsx"
Cohesion: 0.17
Nodes (13): font, metadata, RootLayout(), viewport, BeforeInstallPromptEvent, checkIsStandalone(), InstallPrompt(), ServiceWorkerRegistration() (+5 more)

### Community 72 - "compilerOptions"
Cohesion: 0.11
Nodes (18): compilerOptions, allowJs, esModuleInterop, incremental, isolatedModules, jsx, lib, module (+10 more)

### Community 73 - "critique-storage.mjs"
Cohesion: 0.20
Nodes (14): kebab(), listSnapshotsForSlug(), main(), nowFilenameStamp(), parseFrontmatter(), readLatestSnapshot(), readTrend(), serializeFrontmatter() (+6 more)

### Community 74 - "resolveLengthPx"
Cohesion: 0.12
Nodes (18): checkElementHeroEyebrow(), checkElementHeroEyebrowDOM(), checkElementOversizedH1(), checkElementOversizedH1DOM(), checkElementQuality(), checkHeroEyebrow(), checkOversizedH1(), checkRepeatedSectionKickers() (+10 more)

### Community 75 - "Court"
Cohesion: 0.15
Nodes (3): UpdateCourtInput, mapCourt(), Court

### Community 76 - "010_team_wallet.sql"
Cohesion: 0.24
Nodes (14): idx_wallet_deposits_wallet, idx_wallet_members_customer, idx_wallet_members_wallet, idx_wallet_owner, idx_wallet_splits_booking, idx_wallet_splits_wallet, idx_wallet_transactions_customer, idx_wallet_transactions_wallet (+6 more)

### Community 77 - "context-signals.mjs"
Cohesion: 0.20
Nodes (14): extractPlatform(), extractRegister(), extractSectionValue(), cli(), COMMON_DEV_PORTS, devServerSignals(), gatherSignals(), gitSignals() (+6 more)

### Community 78 - "refreshParamsPanel"
Cohesion: 0.19
Nodes (17): applyParamDefaults(), applyParamValue(), buildParamsPanel(), closedClipPath(), formatRangeValue(), getVisibleVariantEl(), hideParamsPanel(), openTunePopover() (+9 more)

### Community 79 - "onAnnotDown"
Cohesion: 0.20
Nodes (17): beginEditPin(), buildAnnotationsForCapture(), buildPinElement(), cancelEditingPin(), clampPlaceholderSize(), finalizeEditingPin(), initAnnotOverlay(), localCoords() (+9 more)

### Community 80 - "createLiveBrowserSessionState"
Cohesion: 0.20
Nodes (14): createLiveBrowserSessionState(), clearHandled(), clearScrollY(), clearSession(), isHandled(), loadSession(), markHandled(), nextCheckpointRevision() (+6 more)

### Community 81 - "SlotSelector.tsx"
Cohesion: 0.21
Nodes (15): generateFallbackSlots(), getCurrentTimeMinutes(), getNext7Days(), minutesToTime(), Props, Slot, SlotSelector(), handleContinue() (+7 more)

### Community 83 - "checkElementDesignSystemDOM"
Cohesion: 0.13
Nodes (16): browserColorsClose(), browserHasDirectText(), browserRadiusTokens(), browserSampleText(), buildSelectorSegment(), checkElementDesignSystemDOM(), generateSelector(), isBrowserDesignColorAllowed() (+8 more)

### Community 84 - "collectBrowserFindings"
Cohesion: 0.15
Nodes (16): browserDesignSystemConfig(), browserFindingsFromMap(), browserPrimaryFont(), checkBrowserDesignSystemSources(), checkCreamPalette(), checkHtmlPatterns(), checkPageQualityDOM(), checkPageQualityFromDoc() (+8 more)

### Community 85 - "renderTemplate"
Cohesion: 0.19
Nodes (16): cursorBlockMessage(), clampGroupedToBudget(), clampToBudget(), cleanIgnoreValueDisplay(), directiveFooter(), extractFindingIgnoreValue(), extractFindingIgnoreValueRaw(), extractMotionIgnoreValue() (+8 more)

### Community 86 - "manifest.json"
Cohesion: 0.12
Nodes (15): background_color, categories, description, display, icons, id, name, orientation (+7 more)

### Community 87 - "ref_fs"
Cohesion: 0.18
Nodes (11): ensureDir(), GET(), PUT(), SETTINGS_FILE, ApiDocsPage(), loadEndpoints(), metadata, CMS_FILE (+3 more)

### Community 88 - "group_bookings"
Cohesion: 0.23
Nodes (9): group_booking_participants, group_booking_time_slots, group_bookings, idx_gb_participants_customer, idx_gb_participants_group, idx_gb_slots_group, idx_group_bookings_organizer, idx_group_bookings_status (+1 more)

### Community 89 - "sampleCssBackground"
Cohesion: 0.20
Nodes (15): blendRgba(), clampByte(), firstCssUrl(), getLayerValue(), loadVisualContrastImage(), parseObjectPosition(), parsePositionPair(), parsePositionToken() (+7 more)

### Community 90 - "createLiveBrowserDomHelpers"
Cohesion: 0.19
Nodes (10): createLiveBrowserDomHelpers(), cssId(), liveUiRoot(), makeFrozenAnchor(), own(), pickable(), rectIsUsableAnchor(), uiAppend() (+2 more)

### Community 91 - "devDependencies"
Cohesion: 0.13
Nodes (15): devDependencies, autoprefixer, eslint, eslint-config-next, impeccable, @playwright/test, postcss, tailwindcss (+7 more)

### Community 94 - "doctor.ts"
Cohesion: 0.14
Nodes (9): allDeps, errors, fileEnv, jwtSecret, latestDeps, packageJson, REQUIRED_FILES, VALID_PROVIDERS (+1 more)

### Community 95 - "BookingService"
Cohesion: 0.23
Nodes (7): GET(), GET(), runtime, GET(), toPublicBooking(), AvailabilityService, BookingService

### Community 96 - "OwnerPricingPage"
Cohesion: 0.18
Nodes (9): Court, Holiday, OwnerPricingPage(), fetchData(), handleAddRule(), handleDeleteRule(), handleUpdateRule(), PricingRule (+1 more)

### Community 97 - "booking/[sport]/page.tsx"
Cohesion: 0.22
Nodes (10): Props, SportPage(), CourtDetailPage(), Props, BookingSteps(), BookingStepsProps, DEFAULT_STEPS, Step (+2 more)

### Community 98 - "BlockedSlot"
Cohesion: 0.23
Nodes (4): CreateBlockedSlotInput, fmtDate(), formatTime(), BlockedSlot

### Community 99 - "service.ts"
Cohesion: 0.25
Nodes (13): addLoyaltyPoints(), authenticateCustomer(), deductLoyaltyPoints(), getAdminById(), getAllAdmins(), getAllCustomers(), getCustomerByEmail(), getCustomerById() (+5 more)

### Community 100 - "scheduleLazyVisualContrast"
Cohesion: 0.18
Nodes (13): addBrowserFindings(), addVisualContrastFindings(), addVisualContrastResult(), clearOverlays(), detachOverlay(), disconnectLazyVisualContrastObserver(), postExtensionError(), rememberVisualContrastAnalysis() (+5 more)

### Community 101 - "pin.mjs"
Cohesion: 0.22
Nodes (11): CODEX_HARNESSES, commandPrefixForSkillsDir(), __dirname, findHarnessDirs(), generatePinnedSkill(), HARNESS_DIRS, loadCommandMetadata(), pin() (+3 more)

### Community 102 - "rain-check/route.ts"
Cohesion: 0.22
Nodes (8): GET(), VenueRainConfig, getRainForecast(), RainForecast, WeatherData, DEFAULT_DISCOUNTS, getRainPricingFactor(), RainPricingResult

### Community 104 - "014_player_achievements.sql"
Cohesion: 0.27
Nodes (9): achievements, idx_achievements_category, idx_achievements_code, idx_player_achievements_customer, idx_player_achievements_unlocked, idx_player_streaks_customer, idx_player_streaks_type, player_achievements (+1 more)

### Community 105 - "palette.mjs"
Cohesion: 0.21
Nodes (7): args, buildWeights(), hashUnit(), pickSeed(), seed, SEEDS, weightedPick()

### Community 107 - "detect-csp.mjs"
Cohesion: 0.20
Nodes (10): detectCsp(), INLINE_HEADER_SIGNALS, LAYOUT_EXTS, MONOREPO_HELPER_SIGNALS, NUXT_ROUTE_RULES_SIGNALS, NUXT_SECURITY_SIGNALS, SCAN_EXTS, SKIP_DIRS (+2 more)

### Community 108 - "group-booking-validator.ts"
Cohesion: 0.18
Nodes (9): zod, CreateBookingSchema, ValidationResult, addTimeSlotSchema, CreateGroupBookingSchema, inviteParticipantSchema, respondSchema, ValidationResult (+1 more)

### Community 109 - "admin/bookings/page.tsx"
Cohesion: 0.24
Nodes (5): AdminBookingsPage(), FilterChip(), STATUS_CONFIG, WhatsAppButton(), WhatsAppButtonProps

### Community 110 - "form/page.tsx"
Cohesion: 0.27
Nodes (6): BookingFormContent(), BookingFormPage(), getDurationMinutes(), timeToMinutes(), MidtransSnap(), MidtransSnapProps

### Community 111 - "profile/page.tsx"
Cohesion: 0.24
Nodes (8): formatCurrency(), formatDate(), getTier(), LoyaltyData, ProfilePage(), Reward, TIER_CONFIG, UserProfile

### Community 113 - "middleware.ts"
Cohesion: 0.22
Nodes (10): ADMIN_API_ROUTES, ADMIN_ROUTES, config, CUSTOMER_API_ROUTES, CUSTOMER_ROUTES, hasRole(), matchRoute(), middleware() (+2 more)

### Community 114 - "flash_deals"
Cohesion: 0.36
Nodes (7): flash_deal_notifications, flash_deals, idx_flash_deal_notif_customer, idx_flash_deals_court, idx_flash_deals_date, idx_flash_deals_expires, idx_flash_deals_status

### Community 115 - "syncEditBadgeHitProxies"
Cohesion: 0.27
Nodes (10): bindEditBadgeProxy(), editBadgeProxyTargets(), initEditBadge(), initEditBadgeHitProxies(), positionEditBadge(), proxyMouseEvent(), setImportantStyle(), styleEditBadgeProxy() (+2 more)

### Community 116 - "ui-core.mjs"
Cohesion: 0.29
Nodes (8): appendStyleToLiveUiRoot(), appendToLiveUiRoot(), escapeCssIdent(), getLiveUiElementById(), LIVE_CHROME_MOUNT_CONTRACT, LIVE_UI_COMPONENT_IDS, LIVE_UI_SURFACES, resolveLiveUiRoot()

### Community 117 - "recurring/page.tsx"
Cohesion: 0.24
Nodes (8): Area, Court, generateDates(), getDayName(), PreviewDate, RECURRENCE_LABELS, RecurringBookingPage(), Sport

### Community 124 - "venue_verifications"
Cohesion: 0.33
Nodes (5): idx_venue_verification_photos_verification, idx_venue_verifications_status, idx_venue_verifications_venue, venue_verification_photos, venue_verifications

### Community 125 - "scripts"
Cohesion: 0.22
Nodes (9): scripts, build, check, db:generate, dev, doctor, lint, start (+1 more)

### Community 126 - "rain/page.tsx"
Cohesion: 0.22
Nodes (5): DEFAULT_CONFIG, EDUCATION, OwnerRainDiscountPage(), RainDiscountConfig, RainLevel

### Community 127 - "new/page.tsx"
Cohesion: 0.22
Nodes (5): EMPTY_FORM, FACILITY_OPTIONS, NewVenuePage(), SPORTS_OPTIONS, VenueForm

### Community 129 - "support_conversations"
Cohesion: 0.39
Nodes (5): conv_customer_idx, conv_status_idx, msg_conv_idx, support_conversations, support_messages

### Community 130 - "isScreenReaderOnlyTextStyle"
Cohesion: 0.32
Nodes (8): checkElementTextOverflowDOM(), classSelector(), clippedByInset(), clippedByRect(), expandBoxShorthand(), firstMetricLengthPx(), isScreenReaderOnlyTextStyle(), metricLengthPx()

### Community 131 - "fcm-service.ts"
Cohesion: 0.32
Nodes (5): google-auth-library, FCM_CONFIG, getAccessToken(), NotificationPayload, sendPushNotification()

### Community 133 - "bookings/[id]/page.tsx"
Cohesion: 0.32
Nodes (7): BookingDetail, BookingDetailPage(), formatDate(), formatPrice(), STATUS_LABEL, STATUS_STEPS, STATUS_STYLE

### Community 134 - "tentang/page.tsx"
Cohesion: 0.36
Nodes (6): CMS_FILE, generateMetadata(), getPageContent(), getSeo(), SETTINGS_FILE, TentangPage()

### Community 135 - "i18n.ts"
Cohesion: 0.39
Nodes (4): Locale, t(), translations, useTranslation()

### Community 136 - "venue_cameras"
Cohesion: 0.43
Nodes (4): idx_venue_cameras_court, idx_venue_cameras_status, idx_venue_cameras_venue, venue_cameras

### Community 137 - "isGeneratedFile"
Cohesion: 0.38
Nodes (5): hasGeneratedHeader(), HEADER_MARKERS, isGeneratedFile(), isGitIgnored(), searchDir()

### Community 139 - "owner/venues/route.ts"
Cohesion: 0.38
Nodes (6): DELETE(), GET(), globalForPg, POST(), PUT(), slugify()

### Community 140 - "[courtId]/page.tsx"
Cohesion: 0.43
Nodes (6): CourtDetail, CourtDetailPage(), fmt(), generateSlots(), PricingRule, StarRating()

### Community 141 - "cari/[sport]/page.tsx"
Cohesion: 0.38
Nodes (5): Area, CourtResult, formatPrice(), SearchPage(), StarRating()

### Community 142 - "kebijakan/page.tsx"
Cohesion: 0.38
Nodes (5): CMS_FILE, generateMetadata(), getPage(), KebijakanPage(), SETTINGS_FILE

### Community 143 - "profile/bookings/page.tsx"
Cohesion: 0.38
Nodes (6): BookingItem, formatDate(), formatPrice(), MyBookingsPage(), STATUS_LABEL, STATUS_STYLE

### Community 145 - "admin/page.tsx"
Cohesion: 0.47
Nodes (4): AdminDashboard(), DashboardStats, QuickAction(), StatCard()

### Community 146 - "cms/route.ts"
Cohesion: 0.53
Nodes (5): CMS_FILE, ensureDir(), GET(), getPages(), PUT()

### Community 147 - "payments/[id]/route.ts"
Cohesion: 0.47
Nodes (5): handlePaymentAction(), PATCH(), paymentService, POST(), RouteContext

### Community 148 - "dashboard/courts/page.tsx"
Cohesion: 0.33
Nodes (4): Court, Sport, SPORT_CONFIG, Venue

### Community 149 - "photos/[id]/page.tsx"
Cohesion: 0.33
Nodes (3): Court, CourtPhoto, VenuePhotosPage()

### Community 150 - "invoice/[id]/page.tsx"
Cohesion: 0.53
Nodes (5): formatDate(), formatPrice(), InvoiceData, InvoicePage(), statusLabel()

### Community 151 - "gamification/page.tsx"
Cohesion: 0.33
Nodes (3): Achievement, TIER_BADGE, TIER_COLORS

### Community 152 - "context.tsx"
Cohesion: 0.33
Nodes (3): AuthContext, AuthContextType, User

### Community 154 - "applyDeferredSvelteComponentAccepts"
Cohesion: 0.60
Nodes (5): applyLegacyDeferredAcceptsOnStartup(), applyDeferredSvelteComponentAccepts(), deferredAcceptsPath(), readDeferredAccepts(), writeDeferredAccept()

### Community 156 - "AdminPricingPage"
Cohesion: 0.50
Nodes (3): AdminPricingPage(), handleSubmit(), resetForm()

### Community 157 - "gamification/achievements/route.ts"
Cohesion: 0.50
Nodes (4): Achievement, GET(), getAchievements(), globalForPg

### Community 158 - "dashboard/layout.tsx"
Cohesion: 0.40
Nodes (3): navItems, OwnerLayoutProps, OwnerSession

### Community 159 - "profile/reviews/page.tsx"
Cohesion: 0.60
Nodes (4): formatDate(), MyReviewsPage(), ReviewItem, Stars()

### Community 160 - "syarat/page.tsx"
Cohesion: 0.60
Nodes (4): CMS_FILE, generateMetadata(), getPage(), SyaratPage()

### Community 161 - "holidays.sql"
Cohesion: 0.83
Nodes (3): holidays, holidays_active_idx, holidays_date_idx

## Knowledge Gaps
- **501 isolated node(s):** `RainForecast`, `WeatherData`, `RainPricingResult`, `CreateBookingSchema`, `ValidationResult` (+496 more)
  These have ≤1 connection - possible missing edges. (Counts symbols only; 880 node(s) total have ≤1 connection when file, concept and rationale nodes are included.)
- **36 thin communities (<3 nodes) omitted from report** — run `graphify query` to explore isolated nodes.

## Suggested Questions
_Questions this graph is uniquely positioned to answer:_

- **Why does `next` connect `next` to `verifyToken`, `bookings/[id]/page.tsx`, `tentang/page.tsx`, `getDatabaseAdapter`, `owner/venues/route.ts`, `[courtId]/page.tsx`, `checkRateLimit`, `cari/[sport]/page.tsx`, `kebijakan/page.tsx`, `profile/bookings/page.tsx`, `AdminLayout`, `cms/route.ts`, `payments/[id]/route.ts`, `dashboard/courts/page.tsx`, `photos/[id]/page.tsx`, `invoice/[id]/page.tsx`, `gamification/achievements/route.ts`, `dashboard/layout.tsx`, `react`, `profile/reviews/page.tsx`, `syarat/page.tsx`, `src_lib_auth_jwt_customer_token_name`, `notification-service.ts`, `package.json`, `success/page.tsx`, `payment-service.ts`, `src_lib_auth_jwt_admin_token_name`, `booking/page.tsx`, `app/layout.tsx`, `SlotSelector.tsx`, `ref_fs`, `BookingService`, `OwnerPricingPage`, `booking/[sport]/page.tsx`, `rain-check/route.ts`, `@sentry/nextjs`, `form/page.tsx`, `profile/page.tsx`, `middleware.ts`, `recurring/page.tsx`, `rain/page.tsx`, `new/page.tsx`?**
  _High betweenness centrality (0.055) - this node is a cross-community bridge._
- **What connects `RainForecast`, `WeatherData`, `RainPricingResult` to the rest of the system?**
  _501 weakly-connected nodes found - possible documentation gaps or missing edges._
- **Should `live-browser.js` be split into smaller, more focused modules?**
  _Cohesion score 0.028365878725590956 - nodes in this community are weakly interconnected._
- **Why does `MockAdapter` connect `MockAdapter` to `AuditLogEntry`, `domain.ts`, `GoogleSheetsAdapter`, `DatabaseAdapter`, `getDatabaseAdapter`, `Booking`, `snakeToCamel`, `PricingRule`, `Court`, `GroupBookingTimeSlot`, `Sport`, `BlockedSlot`, `TeamWallet`, `Achievement`, `TeamWalletDeposit`, `TeamWalletTransaction`, `VenueVerification`, `Reward`, `PickupGameMessage`, `PlayerProfile`?**
  _High betweenness centrality (0.030) - this node is a cross-community bridge._
- **Should `PostgresAdapter` be split into smaller, more focused modules?**
  _Cohesion score 0.0394255520932123 - nodes in this community are weakly interconnected._
- **Why does `getDatabaseAdapter()` connect `getDatabaseAdapter` to `booking/[sport]/page.tsx`, `verifyToken`, `src_lib_auth_jwt_admin_token_name`, `PostgresAdapter`, `src_lib_auth_jwt_customer_token_name`, `rain-check/route.ts`, `GoogleSheetsAdapter`, `MockAdapter`, `service.ts`, `owner/venues/route.ts`, `notification-service.ts`, `checkRateLimit`, `payment-service.ts`, `BookingService`?**
  _High betweenness centrality (0.029) - this node is a cross-community bridge._
- **Should `verifyToken` be split into smaller, more focused modules?**
  _Cohesion score 0.02998696219035202 - nodes in this community are weakly interconnected._