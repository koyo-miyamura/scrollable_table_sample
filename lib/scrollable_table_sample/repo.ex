defmodule ScrollableTableSample.Repo do
  use Ecto.Repo,
    otp_app: :scrollable_table_sample,
    adapter: Ecto.Adapters.Postgres

  use Scrivener, page_size: 20
end
