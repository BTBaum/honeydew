require 'spec-helper'

# Test creation of todo list
describe "Creating todo lists" do
  it "redirects to the todo list index page on success" do
    visit "/todo_lists"
    click_link "New Todo list"
    expect(page).to have_content("New todo_list")

    fill_in "Title", with: "My todo list"
    fill_in "Description", with: "This is what I'm doing today."
    click_button "Create Todo list"

    expect(page).to have_content("My todo list")
  end

# Test for no title
  it "displays an error when the todo list has no title" do
    expect(TodoList.count).to eq(0)

    visit "/todo_lists"
    click_link "New Todo list"
    expect(page).to have_content("New todo_list")

    fill_in "Title", with: ""
    fill_in "Description", with: "This is what I'm doing today."
    click_button "Create Todo list"

    expect(page).to have_content("error")
    expect(TodoList.count).to eq(0)

    visit "/todo_lists"
    expect(page).to_not have_content("This is what I'm doing today.")
  end

# Test length of title
  it "displays an error when the todo list has a title less than 3 characters" do
    expect(TodoList.count).to eq(0)

    visit "/todo_lists"
    click_link "New Todo list"
    expect(page).to have_content("New todo_list")

    fill_in "Title", with: "Hi"
    fill_in "Description", with: "This is what I'm doing today."
    click_button "Create Todo list"

    expect(page).to have_content("error")
    expect(TodoList.count).to eq(0)

    visit "/todo_lists"
    expect(page).to_not have_content("This is what I'm doing today.")
  end

# Test description
  it "displays an error when the todo list has no description" do
    expect(TodoList.count).to eq(0)

    visit "/todo_lists"
    click_link "New Todo list"
    expect(page).to have_content("New todo_list")

    fill_in "Title", with: "Grocery list"
    fill_in "Description", with: ""
    click_button "Create Todo list"

    expect(page).to have_content("error")
    expect(TodoList.count).to eq(0)

    visit "/todo_lists"
    expect(page).to_not have_content("Grocery list")
  end

# 
  it "displays an error when the todo list has no description" do
    expect(TodoList.count).to eq(0)

    visit "/todo_lists"
    click_link "New Todo list"
    expect(page).to have_content("New todo_list")

    fill_in "Title", with: "Grocery list"
    fill_in "Description", with: "Food"
    click_button "Create Todo list"

    expect(page).to have_content("error")
    expect(TodoList.count).to eq(0)

    visit "/todo_lists"
    expect(page).to_not have_content("Grocery list")
  end
end