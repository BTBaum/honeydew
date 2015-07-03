module TodoListHelpers
  def visit_todo_list(list)
    visit "/todo_lists"
    within "#todo_list#{list.id}" do
      click_link "List Items"
    end
  end
end