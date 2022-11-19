defmodule ScrollableTableSampleWeb.UserLive.Index do
  use ScrollableTableSampleWeb, :live_view

  alias ScrollableTableSampleWeb.Components.ScrollableDataTable
  alias ScrollableTableSample.Users
  alias ScrollableTableSample.Users.User

  @default_page 1
  @per_page 20

  @impl true
  def mount(_params, _session, socket) do
    socket
    |> assing_paginate_users(page: @default_page, per_page: @per_page)
    |> then(&{:ok, &1})
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit User")
    |> assign(:user, Users.get_user!(id))
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New User")
    |> assign(:user, %User{})
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Users")
    |> assign(:user, nil)
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    user = Users.get_user!(id)
    {:ok, _} = Users.delete_user(user)

    socket
    |> assing_paginate_users(page: @default_page, per_page: @per_page)
    |> then(&{:noreply, &1})
  end

  @impl true
  def handle_event("load_more", _, %{assigns: assigns} = socket) do
    next_page = assigns.page + 1

    {:noreply,
     socket
     |> assing_paginate_users(page: next_page, per_page: @per_page)}
  end

  defp assing_paginate_users(socket, page: page, per_page: per_page) do
    paginate_users(page: page, per_page: per_page)
    |> then(&assign(socket, &1))
  end

  defp paginate_users(page: current_page, per_page: per_page) do
    %{
      entries: entries,
      page_number: page,
      page_size: _page_size,
      total_entries: _total_entries,
      total_pages: total_pages
    } =
      Users.list_users(
        page: current_page,
        per_page: per_page
      )

    [
      users: entries,
      page: page,
      total_pages: total_pages
    ]
  end
end
