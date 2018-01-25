defmodule PulapWeb.MaterialHelper do

  import Phoenix.HTML
  import Phoenix.HTML.Form
  import PulapWeb.ErrorHelpers
  require IEx

  def mdc_toolbar(opts \\ []) do
    opts = opts
           |> Keyword.put_new(:id, "header")
           |> Keyword.put_new(:name, "header")
    PulapWeb.MaterialView.render "mdc_toolbar.html", opts: opts 
  end

  def mdc_text_field(form, field, opts \\ []) do
    opts = opts
           |> Keyword.put_new(:id, input_id(form, field))
           |> Keyword.put_new(:name, input_name(form, field))
           |> Keyword.put_new(:value, input_value(form, field))
           |> Keyword.update!(:value, &escape_value/1)
           |> Keyword.put_new(:error, error_tag(form, field))
           |> Keyword.put(:label, label_text(form, field, opts))
    PulapWeb.MaterialView.render "mdc_text_field.html", opts: opts 
  end

  def mdc_button(form, field, opts \\ []) do
    opts = opts
           |> Keyword.put_new(:id, input_id(form, field))
           |> Keyword.put_new(:name, input_name(form, field))
           |> Keyword.put_new(:value, input_value(form, field))
           |> Keyword.put(:class, button_class(opts))
           |> Keyword.update!(:value, &escape_value/1)
           |> Keyword.put(:label, label_text(form, field, opts))
    PulapWeb.MaterialView.render "mdc_button.html", opts: opts
  end

  def mdc_dialog(opts \\ []) do
    opts = opts
           |> Keyword.put_new(:action_enabled, is_action_enabled(opts)) 
    PulapWeb.MaterialView.render "mdc_dialog.html", opts: opts
  end

  def mdc_snackbar(opts \\ []) do
    opts = opts
           |> Keyword.put_new(:action_enabled, is_action_enabled(opts)) 
    PulapWeb.MaterialView.render "mdc_snackbar.html", opts: opts
  end

  defp text_field_type(form, field, opts \\ []) do
    case opts[:label] do
      nil ->
        "text"
      _ ->
        opts[:type]
    end
  end

  defp label_text(form, field, opts \\ []) do
    case opts[:label] do
      nil ->
        field
        |> Atom.to_string
        |> String.capitalize
      _ ->
        opts[:label]
    end
  end

  defp button_class(opts \\ []) do
    case opts[:class] do
      nil ->
        "mdc-button"
      "text" ->
        "mdc-button"
      "raised" ->
        "mdc-button mdc-button--raised"
      "unelevated" -> 
        "mdc-button mdc-button--unelevated"
      "stroked" ->
        "mdc-button mdc-button--stroked"
      "corner" ->
        "mdc-button big-round-corner-button"
      "thick" ->
        "mdc-button mdc-button--stroked thick-stroke-button"
    end
  end

  defp is_action_enabled(opts \\ []) do
    case opts[:action_link] do
      nil ->
        false
      _ ->
        true
    end
  end

  defp value(fun) when is_function(fun, 0), do: fun.()
  defp value(val), do: val

  defp escape_value(nil), do: nil
  defp escape_value(value), do: html_escape(value)
end


# defmodule EnumeratedType do  
#   defmacro __using__(x) do
#     quote do
#       def get(key) do
#         unquote(x)[key]
#       end
#     end
#   end
# end  

# defmodule MDC_ButtonType do  
#   use EnumeratedType, %{
#     "text" => 
#       %MDC_ButtonType{class: "mdc-button"},
#     "raised" => 
#       %MDC_ButtonType{class: "mdc-button mdc-button--raised"},
#     "unelevated" => 
#       %mdc_buttontype{class: "mdc-button mdc-button--unelevated"},
#     "stroked" => 
#       %MDC_ButtonType{class: "mdc-button mdc-button--stroked"},
#     "corner" => 
#       %MDC_ButtonType{class: "mdc-button big-round-corner-button"},
#     "thick" => 
#       %MDC_ButtonType{class: "mdc-button mdc-button--stroked thick-stroke-button"},
#   }
# end
