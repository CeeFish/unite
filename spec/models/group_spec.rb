require 'rails_helper'
RSpec.describe "GroupsControllers", type: :request do
  describe "get groups_path" do
    it "renders the index view" do
      FactoryBot.create_list(:group, 10)
      get groups_path
      expect(response).to render_template(:index)
    end
  end
  describe "get group_path" do
    it "renders the :show template" do
      group = FactoryBot.create(:group)
      get group_path(id: group.id)
      expect(response).to render_template(:show)
    end
    it "redirects to the index path if the group id is invalid" do
      get group_path(id: 5000) #an ID that doesn't exist
      expect(response).to redirect_to groups_path
    end
  end
# describe "get new_group_path" do
#     it "renders the :new template"
#   end
#   describe "get edit_group_path" do
#     it "renders the :edit template"
#   end
  describe "post groups_path with valid data" do
    it "saves a new entry and redirects to the show path for the entry" do
      group_attributes = FactoryBot.attributes_for(:group)
      expect { post groups_path, params: {group: group_attributes}
    }.to change(Group, :count)
      expect(response).to redirect_to group_path(id: Group.last.id)
    end
  end
  describe "post groups_path with invalid data" do
    it "does not save a new entry or redirect" do
      group_attributes = FactoryBot.attributes_for(:group)
      group_attributes.delete(:first_name)
      expect { post groups_path, params: {group: group_attributes}
    }.to_not change(Group, :count)
      expect(response).to render_template(:new)
    end
  end

end