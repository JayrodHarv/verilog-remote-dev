new-proj:
	@if [ -z "$(NAME)" ]; then \
	  echo "Usage: make new-proj NAME=<project>"; \
	  exit 1; \
	fi
	./scripts/new_project.sh $(NAME)