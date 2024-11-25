# Stage 1 - build stage
FROM ruby:3.3.6-slim AS builder

# Install dependencies
RUN apt-get update -qq \
    && apt-get install -y --no-install-recommends build-essential libpq-dev \
    && rm -rf /var/lib/apt/lists/*

# Set up working directory
WORKDIR /project

# Copy and install gems
COPY Gemfile Gemfile.lock ./

# Ensure non-root user has permissions
RUN chown -R 1000:1000 /project

# Switch to non-root user
USER 1000:1000

# Install Bundler and dependencies
RUN gem install bundler \
    && bundle install --path /usr/local/bundle \
    && bundle clean --force \
    && rm -rf /usr/local/bundle/cache

# Stage 2 - final stage
FROM ruby:3.3.6-slim

# Install runtime dependencies
RUN apt-get update -qq \
    && apt-get install --no-install-recommends -y libpq-dev \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Set working directory and ensure ownership
WORKDIR /project

# Copy gems and application code
COPY --from=builder /usr/local/bundle /usr/local/bundle
COPY . .

# Set ownership to match host user
RUN chown -R 1000:1000 /project /usr/local/bundle

# Switch to non-root user
USER 1000:1000

# Default command
CMD ["sh", "./entrypoint.sh"]