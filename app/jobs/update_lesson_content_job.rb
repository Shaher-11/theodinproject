class UpdateLessonContentJob
  include Sidekiq::Worker

  def perform(github_urls)
    lessons = Lesson.where(url: github_urls)

    lessons.each(&:import_content_from_github)
  end

end
