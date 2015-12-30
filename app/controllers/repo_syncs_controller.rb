class RepoSyncsController < ApplicationController
  def create
    # JobQueue.push(
    #   RepoSynchronizationJob,
    #   current_user.id,
    #   session[:github_token]
    # )
    unless current_user.refreshing_repos?
      current_user.update_attribute(:refreshing_repos, true)

      RepoSynchronizationJob.perform_later(current_user)
    end

    head 201
  end
end
