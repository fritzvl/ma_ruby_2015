ActiveAdmin.register_page "Dashboard" do

  menu priority: 1, label: proc{ I18n.t("active_admin.dashboard") }

  content title: proc{ I18n.t("active_admin.dashboard") } do
    columns do
      column do
        panel 'Posts' do
          raw "Currently we have <b>#{Post.count}</b> posts in our blog"
        end
      end

      column do
        panel 'Comments' do
          raw "Currently we have <b>#{Comment.count}</b> comments in our blog"
        end
      end

      column do
        panel 'Authors' do
        raw "<b>#{Post.all.map(&:author_id).uniq.count}</b> authors write at blogs of <b>#{Author.count}</b> authors registered"
        end
      end
    end
  end
end