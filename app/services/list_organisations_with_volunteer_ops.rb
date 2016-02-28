class ListOrganisationsWithVolunteerOps

  def self.with(listener, scope, model_klass = Organisation)
    new(listener, scope, model_klass).send(:run)
  end

  private

  attr_reader :listener, :scope, :model_klass

  # rubocop:disable Lint/UnusedMethodArgument
  def initialize(listener, scope, model_klass)
    local_variables.each { |v| instance_variable_set("@#{v}", eval(v.to_s) ) }
  end
  # rubocop:enable Lint/UnusedMethodArgument

  def run
    orgs = model_klass.join(:volunteer_ops).where(scope)
    [listener.build_map_markers(orgs), orgs]
  end
end