defmodule InfoSys.Supervisor do
  use Supervisor

  def start_link(opts) do
    IO.puts "#{__MODULE__} started"
    Supervisor.start_link(__MODULE__, opts)
  end

  def init(_opts) do
    children = [
      InfoSys.Cache,
      {Task.Supervisor, name: InfoSys.TaskSupervisor},
    ]

    Supervisor.init(children, strategy: :rest_for_one)
  end
end
