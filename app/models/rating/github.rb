module Rating
  class Github < Struct.new(:project)
    def fetch
      return 0 if project.github_path.blank?

      user, repo = project.github_path.split '/'
      info = client.get user, repo
      info['watchers']
    end

    private

    def client
      @client ||= ::Github::Repos.new
    end
  end
end
