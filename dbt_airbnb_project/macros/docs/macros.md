### `safe_divide(numerator, denominator)`

Retorna o resultado da divisão `numerator / denominator`, mas evita divisão por zero.
Se o denominador for 0, retorna `NULL`.

**Exemplo de uso:**
```sql
{{ safe_divide('total_price', 'total_reviews') }}
