require_relative 'ui'
require_relative 'logic'

def joga(nome)
    mapa = le_mapa(2)
    while true
        desenha mapa
        direcao = pede_movimento

        heroi = encontra_jogador mapa
        nova_posicao = heroi.calcula_nova_posicao, direcao
        if !posicao_valida? mapa, nova_posicao.to_array
            next
        end

        mapa[heroi.linha][heroi.coluna] = " "
        mapa[nova_posicao.linha][nova_posicao.coluna] = "H"

        mapa = move_fantasmas mapa

        if jogador_perdeu?(mapa)
            game_over
            break
        end
    end
end

def iniciaPacMan
    nome = da_boas_vindas
    joga nome
end

def jogador_perdeu?(mapa)
    perdeu = !encontra_jogador(mapa)
end