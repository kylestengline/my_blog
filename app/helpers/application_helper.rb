module ApplicationHelper

  def admin_edit_code
    if signed_in?
      link_to "Edit", edit_user_code_path(@code.id), class: "btn btn-primary btn-lg btn-space" 
    end
  end

  def admin_delete_code
    if signed_in?
      link_to "Delete", user_code_path(@code), method: :delete, 
        data: { confirm: "Are you sure you want to delete this post?" }, 
        class: "btn btn-danger btn-lg btn-space"
    end
  end

  def admin_edit_life
    if signed_in?
      link_to "Edit", edit_user_life_path(@life.id), class: "btn btn-primary btn-lg btn-space" 
    end
  end

  def admin_delete_life
    if signed_in?
      link_to "Delete", user_life_path(@life), method: :delete, 
        data: { confirm: "Are you sure you want to delete this post?" }, 
        class: "btn btn-danger btn-lg btn-space"
    end
  end

  class CodeRayify < Redcarpet::Render::HTML
    def block_code(code, language)
      CodeRay.scan(code, language).div
    end
  end

  def markdown(content)
    coderayified = CodeRayify.new(safe_links_only: true, hard_wrap: true)

    options = {
      fenced_code_blocks: true,
      no_intra_emphasis: true,
      prettify: true,
      disable_indented_code_blocks: true,
      lax_spacing: true,
      superscript: true
    }

    markdown_to_html = Redcarpet::Markdown.new(coderayified, options)
    markdown_to_html.render(content).html_safe
  end
end
