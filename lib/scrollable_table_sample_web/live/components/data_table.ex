defmodule ScrollableTableSampleWeb.Components.DataTable do
  @moduledoc """
  Data table.
  """
  use Phoenix.Component

  def table(assigns) do
    ~H"""
      <table>
        <thead>
          <tr>
            <%= render_slot(@thead) %>
          </tr>
        </thead>
        <tbody
          id="users"
          phx-update="append"
          phx-hook="InfiniteScroll"
          data-page={@page}
          data-total_pages={@total_pages}
          data-el=".infinite-scrollable-table"
        >
          <%= for row <- @rows do %>
            <tr id={"user-#{row.id}"}>
              <%= render_slot(@tbody, row) %>
            </tr>
          <% end %>
        </tbody>
      </table>
    """
  end
end
