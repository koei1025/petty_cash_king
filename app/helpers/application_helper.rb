module ApplicationHelper
  def pmktitle(page_title, sub_title=nil)
    page_title_show = page_title.split(' ')[0]
    content_for(:title) { page_title_show }
    if sub_title.nil?
      ["<div style='text-align:left'>", page_title, '</div>'].join.html_safe
    else
      ["<div style='text-align:left'>", page_title,'<small>',sub_title,'</small>', '</div>'].join.html_safe
    end
  end 
  def go_back(*page)
    link_to('', page.present? ? session["return_to#{page.join()}".to_sym] : 'javascript:history.go(-1);', class: 'fa fa-arrow-left', data: { disable_with: '.' }, title: '返回')
  end     
end
