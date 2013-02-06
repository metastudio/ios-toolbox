class GithubPathValidator < ActiveModel::EachValidator
  def github_path_regexp
    /\A\/[^\s\/]+\/[^\s\/]+\z/.freeze
  end

  def validate_each(record, attribute, value)
    allow_blank = options[:allow_blank] || true
    return if allow_blank && value.blank?
    record.errors.add attribute, 'should be a valid GitHub path (/username/repo)' unless value =~ github_path_regexp
  end
end
