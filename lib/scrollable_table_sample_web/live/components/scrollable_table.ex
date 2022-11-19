defmodule ScrollableTableSampleWeb.Components.ScrollableDataTable do
  @moduledoc """
  Scrollable data table.
  """
  use Phoenix.Component
  alias ScrollableTableSampleWeb.Components.DataTable

  def table(assigns) do
    ~H"""
      <div style="overflow-y: scroll; max-height: 70vh;" class="infinite-scrollable-table">
        <DataTable.table>
          <%= render_slot(@inner_block) %>
        </DataTable.table>
      </div>
    """
  end

  def thead(assigns) do
    ~H"""
      <DataTable.thead>
        <%= render_block(@inner_block) %>
      </DataTable.thead>
    """
  end

  def tbody(assigns) do
    ~H"""
      <tbody
        id="rows"
        phx-update="append"
        phx-hook="InfiniteScroll"
        data-page={@page}
        data-total_pages={@total_pages}
        data-el=".infinite-scrollable-table"
      >
        <DataTable.tbody let={row} rows={@rows}>
          <%= render_block(@inner_block, row) %>
        </DataTable.tbody>
      </tbody>
    """
  end
end
