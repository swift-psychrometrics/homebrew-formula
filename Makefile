PULL_REQUEST :=
MESSAGE :=

.PHONY: pr
pr:
	gh pr create --base main --fill

.PHONY: merge
merge:
	gh pr merge --merge --subject "$(MESSAGE)" "$(PULL_REQUEST)"
