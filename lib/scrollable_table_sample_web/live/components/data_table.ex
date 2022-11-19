defmodule ScrollableTableSampleWeb.Components.DataTable do
  @moduledoc """
  Data table.
  """
  use Phoenix.Component

  def table(assigns) do
    ~H"""
      <table>
        <%= render_slot(@inner_block) %>
      </table>
    """
  end

  def thead(assigns) do
    ~H"""
      <thead>
        <tr>
          <%= render_slot(@inner_block) %>
        </tr>
      </thead>
    """
  end

  def tbody(assigns) do
    ~H"""
    <%= for row <- @rows do %>
      <tr id={"row-#{row.id}"}>
        <%= render_slot(@inner_block, row) %>
      </tr>
    <% end %>
    """
  end
end
