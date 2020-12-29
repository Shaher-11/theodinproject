class GithubWebhooksController < ActionController::Base
  include GithubWebhook::Processor

  # Handle push event
  def github_push(payload)
    p payload
  end

  # Handle create event
  def github_create(payload)
    # TODO: handle create webhook
  end

  private

  def webhook_secret(payload)
    'Js_bQxVMW_WBkppf2nhN'
  end
end
