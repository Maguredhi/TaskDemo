require 'capybara/rspec'

feature "Tasks Test" do
  scenario "確認任務首頁" do
    visit tasks_path
    expect(page).to have_text("任務列表")
    expect(page).to have_text("新增任務")
  end

  it "確認新增任務連結" do
    visit tasks_path
    click_link "新增任務"
    expect(page).to have_current_path(new_task_path)
  end

  it "新增一個任務" do
    visit new_task_path
    fill_in "使用者ID", with: "1"
    fill_in "任務名稱", with: "test"
    fill_in "任務內容", with: "HI"
    fill_in "優先權", with: "1"
    click_button "Create Task"
  end
end