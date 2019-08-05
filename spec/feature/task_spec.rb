require 'rails_helper'
# require 'factories/task'


feature "Tasks Test" do

  scenario "確認任務首頁" do
    visit tasks_path
    expect(page).to have_text(I18n.t('task.list'))
    expect(page).to have_text(I18n.t('task.new'))
  end

  it "確認新增任務連結" do
    visit tasks_path
    click_link I18n.t('task.new')
    expect(page).to have_current_path('/en/tasks/new')
  end

  it "新增一個任務" do
    visit new_task_path
    user = User.create(id: 1, name: "test")
    fill_in I18n.t('task.holder'), with: "1"
    fill_in I18n.t('task.title'), with: "test"
    fill_in I18n.t('task.content'), with: "HI"
    fill_in I18n.t('task.priority'), with: "1"
    click_button "Create Task"

    # expect(page).to have_current_path('/en/tasks')
    expect(page).to have_content(I18n.t('task.create_ok'))
    expect(Task.count).to eq 1
  end

  # feature 'check created_at order asc' do
  #   let(:task1) { Task.create(:task, title: 'task1', created_at: Time.zone.now) }
  #   let(:task2) { Task.create(:task, title: 'task2', created_at: Time.zone.now - 1.day) }
  #   let(:task3) { Task.create(:task, title: 'task3', created_at: Time.zone.now + 1.day) }
  #   let(:order_result) { %w[task2 task1 task3] }
    
  #   before do
  #     # create data
  #     task1
  #     task2
  #     task3
  #   end

  #   it "用已建立時間來排序" do
  #     visit tasks_path(@tasks)

  #     # catch title of view elements
  #     page_order_titles = []
  #     all('table tr').each do |tr|
  #       tds = tr.all('td')
  #       title = tds[1].text
  #       page_order_titles << title
  #     end
  #     # check order is ok
  #     expect(page_order_titles).to eq order_result
  #   end
  # end
end