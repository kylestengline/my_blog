module ControllerMacros
  def login_admin_user
    allow(request.env["warden"]).to receive(:authenticate!) { user }
    allow(controller).to receive(:current_user) { user }
  end

  def has_before_filters *names
    expect(controller).to have_filters(:before, *names)
  end
end
