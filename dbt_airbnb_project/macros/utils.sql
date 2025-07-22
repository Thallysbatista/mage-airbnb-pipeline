{% macro safe_divide(numerator, denominator) %}
    {# docs(safe_divide) #}
  case
    when {{ denominator }} = 0 then null
    else {{ numerator }} / {{ denominator }}
  end
{% endmacro %}
