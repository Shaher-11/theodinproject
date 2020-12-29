class GithubWebhooksController < ActionController::Base
  include GithubWebhook::Processor

  def github_push(payload)
    return unless payload[:ref] == 'refs/heads/master'

    github_urls = payload[:head_commit][:modified].map { |url| "/#{url}" }

    UpdateLessonContentJob.perform_async(github_urls)
  end

  private

  def webhook_secret(_)
    ENV['GITHUB_WEBHOOK_SECRET']
  end
end
