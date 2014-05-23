require "test_helper"

class ProjectsControllerTest < ActionController::TestCase

  def project
    @project ||= projects :one
  end

  def test_index
    get :index
    assert_response :success
    assert_not_nil assigns(:projects)
  end

  def test_new
    get :new
    assert_response :success
  end

  def test_create
    assert_difference('Project.count') do
      post :create, project: { description: @project.description, link: @project.link, name: @project.name, technologies_used: @project.technologies_used }
    end

    assert_redirected_to project_path(assigns(:project))
  end

  def test_show
    get :show, id: project
    assert_response :success
  end

  def test_edit
    get :edit, id: project
    assert_response :success
  end

  def test_update
    put :update, id: project, project: { description: @project.description, link: @project.link, name: @project.name, technologies_used: @project.technologies_used }
    assert_redirected_to project_path(assigns(:project))
  end

  def test_destroy
    assert_difference('Project.count', -1) do
      delete :destroy, id: project
    end

    assert_redirected_to projects_path
  end
end
