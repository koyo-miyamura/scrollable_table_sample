defmodule ScrollableTableSampleWeb.Components.ScrollableDataTable do
  @moduledoc """
  Scrollable data table.
  """
  use Phoenix.Component

  def table(assigns) do
    ~H"""
      <div style="overflow-y: scroll; max-height: 70vh;" class="infinite-scrollable-table">
        <table>
          <thead>
            <tr>
              <%= for column <- @columns do %>
                <%= column.label %>
              <% end %>
            </tr>
          </thead>
          <tbody
              id="rows"
              phx-update="append"
              phx-hook="InfiniteScroll"
              data-page={@page}
              data-total_pages={@total_pages}
              data-el=".infinite-scrollable-table"
            >
            <%= for row <- @rows do %>
              <tr id={"row-#{row.id}"}>
                <%= for column <- @columns do %>
                  <%= render_slot(column, row) %>
                <% end %>
              </tr>
            <% end %>
          </tbody>
        </table>
      </div>
    """
  end
end
