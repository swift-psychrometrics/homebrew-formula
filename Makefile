TAP = swift-psychrometrics/homebrew-formula
FORMULA = psychrometrics

.PHONY: audit
audit:
	brew tap "$(TAP)" && brew audit --strict --online "$(FORMULA)"
