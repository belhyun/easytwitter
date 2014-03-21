module JsonHelper
  def self.res_success
    {:result => 1, :msg => 'success'}
  end

  def self.res_fail(msg)
    {:result => 0, :msg => msg}
  end
end
