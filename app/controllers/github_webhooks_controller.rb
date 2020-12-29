class GithubWebhooksController < ActionController::Base
  include GithubWebhook::Processor

  def github_push(payload)
    p payload
  end

  private

  def webhook_secret(_)
    ENV['GITHUB_WEBHOOK_SECRET']
  end
end
