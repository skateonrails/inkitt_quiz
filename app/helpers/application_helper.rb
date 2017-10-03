module ApplicationHelper
  FLASH_MESSAGE = {
    notice: 'alert-primary',
    success: 'alert-success',
    error: 'alert-danger'
  }.freeze

  def alert_class(key)
    FLASH_MESSAGE[key.to_sym]
  end
end
