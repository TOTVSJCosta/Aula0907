#include "totvs.ch"


user function Pets()
	local cArq := "c:\Protheus2310\pets.csv"
	local nHandle, cLinha
    local aLinha

    RPCSetEnv("99", "01", "admin", "1")

	if file(cArq) .and. (nHandle := FT_FUse(cArq)) != -1
		FT_FGoTop()

		While !FT_FEOF()
			cLinha  := FT_FReadLn()
            aLinha := Separa(cLinha, ';')

            RecLock("Z01", .f.)
                Z01->Z01_FILIAL := aLinha[1]
                Z01->Z01_CODIGO := aLinha[2]
                Z01->Z01_NOME   := aLinha[3]
            Z01->(msUnlock())

			FT_FSKIP()
		End
		// Fecha o Arquivo
		FT_FUSE()
	else
		msgAlert("Erro na abertura do arquivo " + cArq)
	endif

return
