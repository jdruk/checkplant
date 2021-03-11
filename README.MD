## Problema do Macarrão Instantâneo

João é um fanático por "miojos"; ele os adora, e, como era de se esperar, ele levou vários pacotes quando foi acampar com seus colegas. Como João só gosta de miojos feitos com o tempo exato, ele se deseperou ao perceber que havia esquecido seu relógio em casa.
Por sorte, ele conseguiu, no caminho, comprar duas ampulhetas de durações diferentes. Por exemplo, se o miojo precisa de 3 minutos para ficar pronto, e João tiver uma ampulheta de 5 minutos e outra de 7, uma possível forma de cozinhar o miojo é:
João começa virando as duas ampulhetas ao mesmo tempo.Quando a areia da ampulheta de 5 minutos se esgotar, João torna a virá-la.João começa a preparar o miojo quando a areia da ampulheta de 7 minutos acabar.João tira o miojo do fogo quando a ampulheta de 5 minutos acabar novamente.Dessa forma, o miojo ficará 3 minutos no fogo (do minuto 7 ao minuto 10). Assim, apesar do miojo levar apenas três minutos para ser cozido, ele precisa de 10 minutos para ficar pronto.Faça um programa que, dado o tempo de preparo do miojo, e os tempos das duas ampulhetas (ambos maiores que o tempo do miojo), determina o tempo mínimo necessário para o miojo ficar pronto ou se não é possível cozinhar o miojo no tempo exato com as ampulhetas disponíveis.

```ruby

 # HAPPY PATH
  params = {
      cup_noodles: CupNoodles.new(preparation_time: 3),
      hourglass_one: Hourglass.new(duration_time: 7),
      hourglass_two: Hourglass.new(duration_time: 5)
    }
    result = ::Operations::PreparingCupNoodles.new(params).call 
    
    result.value # {time_minimum: 10}
    result.success? # true
    
    ### SAD PATH
    
    params = {
        cup_noodles: CupNoodles.new(preparation_time: 3),
        hourglass_one: Hourglass.new(duration_time: 10),
        hourglass_two: Hourglass.new(duration_time: 5)
    }
    result = ::Operations::PreparingCupNoodles.new(params).call 
    
    result.value # nil
    result.errors # 'it is not possible to prepare the noodles with the current hourglasses'
    result.success? # false
    
    params = {
        cup_noodles: CupNoodles.new(preparation_time: 3),
        hourglass_one: Hourglass.new(),
        hourglass_two: Hourglass.new(duration_time: 5)
     }
    
    result = ::Operations::PreparingCupNoodles.new(params).call 
    result.success? # false
    result.errors # 'the time of all objects must be greater than or equal to zero and not null'
    
    
    # poderia-se fazer um helper para formatar e deixar mais bonitinho a saída mas para efeito de entedimento acredito que aqui ja ta bom.
    ::Helpers::Result.format_result(result) 
``

