// /loadrace mods/detonator
// Original idea by ModdedPan and the fantastic sprites were done by Blaac!

#define init // Load When Mod Loads
 // Define Sprites:
global.spr_nothing = sprite_add_base64("iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAYAAAAfFcSJAAAABmJLR0QA/wD/AP+gvaeTAAAACXBIWXMAAAsTAAALEwEAmpwYAAAAB3RJTUUH4AkKEQIGfow9xwAAAAtJREFUCNdjYAACAAAFAAHiJgWbAAAAAElFTkSuQmCC",1,0,0);
global.spr_idle = sprite_add_base64("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",9,13,13);
global.spr_walk = sprite_add_base64("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",6,17,17);
global.spr_hurt = sprite_add_base64("iVBORw0KGgoAAAANSUhEUgAAAGAAAAAgCAYAAADtwH1UAAADgUlEQVR4nO2ZwU8TQRTGf7VwVIht0ljvXEo5eCgYg9aEGC54NcR/gRt/gDUx3ggXDnI0Ue/KpYcmFoip9FATilF78VbSpCWFM2Q9LLOd3c52d0rZrWG/hNDO7M43731v3nvdjeULRAgRt8LewE1HJEDIiAQIGZEAIWNi2Bu/vjIMt7mnr2OxYdf1i3IBV/58gf+GP6bbBQ1yvAqjFkMYnk7NkEhOW+OJu6neNfs71udRi6HLf74AS8vue9ASQNf5AqMSoVzAyGZyyjnZAQCdkxYA9Z9VTydcN/+gIPBdA4Z1vu69pSJGqdh/vFXGC6PF/85Jy/oT4/nFFSa++9+rituNX4bMLfgBspmcdWpUto1dEXZGqpsg0Isyp9GddrdvXKzhtpaTX76+VMQ4X+i/Vg4A+QQIfue4yj5fAlwl+oeBc5PxtSkMw+Dw6KDv2vpGlfpGFegZrpoD05l+U9HSMrFSESO+NkW8AvEK/LhdtV3jDAAnvzMwVNyeXdAonK9TA0TkyQ6QcXh0wNzsPGDmVyes6JecYXyY4mLr1FcdkPkBLrZOiWPuIV7pcgh2/qJ5X3Y918fffN+A5cGNgGcRHlX064ogHH9/PWXrNgSsY+6Ye/TsBU9yaQDevtkEvAthmPyBCQBDiFABPl6egJemwXOz89xJ3gMg++AxgGXwbrVp+y7GnuTSrK6uIvK435MQr1x+kfag4hecgl819m5zXdmNjU0RVhZHh/MFztrH/P39iy+ftpVr7VabluH12p5tTicNXTyU93Dqm1/eh8w/VA0ICs7uA8z8uzS5AtvPAWwFTYV6bc8Wlc6I1CnAYLae+cnL9bahczKvxe8HAwUIuvsBu5PM/nmHdGrGmhc5N5GcptPuUq/tUa/17ndGPPQLoYPyvje/yevOPwhKAcJwvAz55z5As9Ugm8nRaXfptLs2J5y1j4H+FrTZalifv+1+Hlv+viJ8Hc7XKb7lAoYccSqouhI36HZAQfPbivB1Rb7fdb2MTySntYyX1x1X/sC6oKuKKx9p5897GSJNiJSQzeTIL674FiFoflsKCiL3D0pHg5wkHoQJ4xuNPzaneN0H3ukgDH5bEXZzjpswfnK7jqhuzpEdo/usv1yojjW/r/cBshODeNvlhOyAIN52Bcmv/UYswmgxNo8ibioiAUJGJEDIiAQIGZEAISMSIGREAoSMfx0aQ1jRsEgfAAAAAElFTkSuQmCC",3,17,17);
global.spr_dead = sprite_add_base64("iVBORw0KGgoAAAANSUhEUgAAAMAAAAAgCAYAAABEmHeFAAAABmJLR0QA/wD/AP+gvaeTAAAACXBIWXMAAAsTAAALEwEAmpwYAAAAB3RJTUUH4AwPCzYqGfH7NwAABRlJREFUeNrtXD1v21YUPaqUsbFhGRKqTl0MGIoDtAOdok2sAkbhxVlbtz+gSzb/gKpA0S3IkqEZC7Q/oMiiwUAdR4UcDi5gJXDBpUAHBRREQ07XGOxAXebxiR/vUZREW/cAgiFK5CHfO+fe+y5pFRpNMBgLi/d4CBhsAAaDDcBgsAEYjIVCKe2Of3zvulGfffFDoTDtEz9sIpK/0cS152dkg4JuFyhO+LMwAwmvVl1DeXXZ315eqb77zvOnUxOjLv/bO8D2DhviWhhAV/xZm+CwCXejboR+JgoQAJxzGwDQfWVmJsK0/JwRrsEaIK34dfc9aME9aI2XF2HiI9HRX+fc9l+0vXF3F6Vj9XMN404Sv8xN/ACwUTf8rBF1bQxeBPuQI3WcaEhosuicwXBsOx0jSYDEL37/oAX37Z3oqF9eqQYyAPHL28Ouj3EFDDBJ9M/CBMUHS3BdF6cvX4x9t/vQRPehGRBe2GckZlUBbu+gcNCCW3ywhGIHKHaAv943Yw0o88vGZPFfwS5QFuLXWQNQ5BUFKOL05QvcvrXp19djWYGivyBG99clXD6+UBKgyA8Al48vUIR3DsXOEKdAkL81KnX2jTH+3i8WsHN1u0LyWCzkIjir6K9rAhL+h/vVQLdlrMyQPvvsy6+wZdQAAD/9+CjVQnTe/JMGpayaDlEGiGsBA9M3fDuB/3MN/pkZIJUJOgB+G2WAbz3B3b61iZurH3hR95N7AOAL7pnZC7ynbVtGDXt7e6A6XjUTFDujN8I5hPETJ/GHbfv50f7E3SiduZjGvRgS/kbdiOx6hRlep/RUEf56Av/ZK1PZBCXkBKGDJImf8GbwGs5giH/+PsP9b74bO5ZohO7JEbaMr7XqcIp8l5966w/vHC6U+cXz6J4c+UZJI4K0AYj2S2MEcS7EaC92wUTByfA6X6abRTYQo/26Iv963UB7xJ9khNwYQO6+UP29fWMXeHI/8aIBBMQmGkF3ESpOfuPG6HhPAOd8U4t/FpFe5Vi6JigdAzh+d8MvrNRLApnlsGm625omEEVfSclPZmk3TTfOBKU8dX9kkXrR56k/CeJAlFeX4QyG6J4coXsSFGFURkiV9p8n83u80fzzEH4aE4h3udOivFINBKpadQ2HTctVyQQk/EqG/JXqGtpNK9IEpbwIP24ieraFjboBZzCEMxgGRPhm8Hqs60P7EP589nvu+fMw5qLw6fxr1TX8+5GFj/8zlI4jZ+ny6jJ6dvI6oN2EKwq/P+KvSI+cpOHv2xqL4GlMhE4Klici1OUaA6LbgZkX/ywMEDcPoul7thXIAjoGEO/K64yDGP37thXIAjrjHcUftTAOGGCak6CaguPEp1sH0sCrLsbmzT8LIyTNA40BXauY8VTFFyZAZzBEz7YSx4EywTT4+7Y1ZoKZPQox6cSKJYXcApMvlF60GGvc3U3sXeedf57zEHbDMQ289YD+OJxlxO+tB4L8pVkPflIEEoUW1lXwU9woosQfy9vPObf91lxSBJo3f14gr2nE7UkROalblyd+pceho6KGSlkj75umLy0+iSlGI9WyRnyfRoCz5s9DGSRGbbkRoFsKysFCpQwSozYtitcn4O8L/GIZpG2AWfy3V9yEzCOCzpN/Ho+ixBmYTOF3wsRH0UfipFakKPy049YO4a9o8JPwo9qgBf5doKuHvDwSoYJpBIy2Bn/SnWA2AGOhwb8KwWADMBhsAAaDDcBgsAEYDDYAg7EI+B/BQp3Uow3PPwAAAABJRU5ErkJggg==",6,17,17);
global.spr_sit1 = sprite_add_base64("iVBORw0KGgoAAAANSUhEUgAAAGAAAAAgCAYAAADtwH1UAAAEEUlEQVR4nO1az0sbQRT+1o1Hu2IEac5BDxqhPUQLRSN46KWl50bo0UsOhZ56am7+Ax7qsVBLj6W9eAhEQ8GwhwgNogbBW0ogCaY9NnF72Mw4O9mdnf0RN8V8ILjJzHzvve+9NzOrSiaPMSLERNQG3HeMBYgYYwEixkgJUDiA8T+uHQQjJcDmMyhR23DXiLEPJEtEgTjMizMpkx9uEP3yhyWuV363mMbsPiQT2UmEOLWYpmPiM3P091a70R+nG7whMsK6ISh/UAH88qs5Db3djuO6jgKoOQ247FByllgEMu4wrxthVUMQfj+9n0+YoP6LxFfcLmJeyHlUT3V0V00xNy470mKQjC0cwIiVrVnnBSdTOs1ALxXAihaEv3qqu7Zk2024cACjmNSMYlIzjABnB+OTBvXYuq7s3GJSM9Schu7q7WfxmTlL2fMg35Mxak4Dsh2oOc0Tt5rTzJ9jgPWf5281r4X8LJz4bVtQrAx00YF6TOasUALgtt+1mteIz05bDKDGtRtAtm9gVkFxXzN6cO6FLEjgAANqFsDSiu04nn8AhB+CMTbo7ZqiAVb/id9O4L/vZ68BKEDytqWzGGhBpOXwwbYldAkAv4aoJEnbiYqfwI6/1bxG/WMNAJB4Pe84lx0Tn50e4D+Z0gdaoUUAPgiso34MYEGclzmRDIu/uyreENk28ejPYN8nLefFq20AwHo6AQA40uv49nkPABwT4ue7C9u9aEAAs/RAWwAALPdbgBcDHsw+xI/Dr4QG2Dc3YjcBCgcwbveNEPkB9J7ICcC2QAB4mnmJ1OM1ynmk1+kc1gbyvPvhCwBQfkVR6F4mFIA1AgA2J58DAP5OTHg2YPLmBgBQ3C7Rc7DsSYQkwsbeWnD+0ndgX/NkAz2G9v2v1S4sorP8PNbTCbx98x7z8wvUf2Wr49j66CmIPfvGymYJttoNtNoNXJ2fORIe6fUBg67Oz+jc5Z0FxMreLmGxMrC8sxAO/1IaypZZ+rI28P7zqFZKwmcAFv+FXOQX1rhMHgq50QFAYs7ad6uVEs1Iu2fA7LnsekIrOIwav909wC7oBPHZaWl+x5uwaYRZFXYbi5sB9Uaw90KjxM/yVSsQVmS1Yl3DjcdRAAKivh8DwoBf/tRiOpTXIYT/d/PXwMWLBbGJJIssv/BVRJDXEIDcuXtY3EFtuCt+1wrgIcoC4a3UBwgX21P5/YBFvWHeA1KLaaGdfvj5z+wgO46FqwB2QXBCvRGe83Y2mH255vhOh/TtYfATcUUJIJMkPKQrgA2C05gwnSfB5p3x0k7qjZrvFmjHL5sAXviFAjgFQQZBnB9lhO2TVAWQ8nMjd8sQr/C7nqy9o8Dv+geZMYaLkfqviPuIsQARYyxAxBgLEDHGAkSMf8Zp4Qt+NmOuAAAAAElFTkSuQmCC",3,12,13);
global.spr_sit2 = sprite_add_base64("iVBORw0KGgoAAAANSUhEUgAAAIAAAAAgCAYAAADaInAlAAAEEklEQVR4nO2aP2vbQBjGn6vcMcjEgUBmkwxNAu2QJlDSGDx4Cl2y1IWOWfwFOtVbvoCGZizUpWNpFw8CO6FgoyGBmtAmBLIZAkmI6BpzHeSTT7L+nCzJptU9YLCs0/3eOz139+osslOHVIb1aNYBSM1W0gAZlzRAxiUNwElvgv6LdceRNACncgVk1jFMW7moF7TrwU7eqU/eiWyUBN2INPkimpSflLmi8sP6VNgADLz2ZMP+rTC/aH+/vbseljOoVyBRpTdB+aDj8EWMFaa4/LgGmJSv1FQMNNO33jED8GsVC7pdB+XBQWLl2nWDxjGBUlOBSxOz4vOKw59k7XcbNm77g8xH3BtBehNUqalA1ep8Qpyui6LemQF3J0QdCVEa78V/2LTMVLo0hblsxOpN0Fx38vafzhn2CIzSbr6/4vBZ/weVGUsCyxWQ0qVJ0FCBhgrK+bcwv+icdm7uHdey86wM/aSi9R5U6QxHtKD0JmirqNJWUaVx+UrHWa9oDK2iSpWaiofNyflsICk1NRJbqanWp4NY/c/Lj++ZA+hNUNQAVBnguQUcrjN+GjvPrm/kAYiP/lwXeIAJpcNijsmvErQaKh3Afy3kNZoBKZQqgNWYfOSFuEwDzRwOmHjtH44eChCgOFpSeY0tAWzKZS66vbvG7c09+h8vAABLb5d9A+DLFBbyjjoAsSlpVnw27afJL+wZoQMgTf7pnDE2CMcMwAfhFptydl/vAwBebiwBAI6MPr59PrQaueDtdpGb774JafBFMvI0+IU9I5TNT9NP/yTL//nu3DMX8UwCAQzXTiueFzuvsPZs24YeGX27PB8EO9Y+fAEA/Gh/ZRigEZ4M2QkoYE/BSfJLl6bQTRjlDQnyAQy2gpdBu++5JSgJPiHEzmXcfEcO4LgBDaB0uAsAuLo4twNwiw+G6er3Lywvr6C0vYvW/jGA4GdRpnIFRNdMq9UaUH6cDH+gAYAJVMLzkHIFRN+y+iGR9h9/t80fJhabrpk0yfbzdbvleAooV0AGmomBZmL9YMVafzwSj97JceAxAPva9YMVkDfWyBdxf7kCkutaU2BS/Fw32uNnrovk2r+6IdR+Nz/J9gey3D+wIHvDHSXA+znUC8pUWMijd2bYxyIbMnzn7NRB2lPm88oS33cr2ApilJQwYO/EmmL81Dtx1uFbMESSPx2+51MAkzsbdm88eInPQkUy/yBJfvp8XwPE2YLlNWknSP50+IH/BjLH8a4KcqFoOVFJfvp8ob+Db2/u0b8e7jIt+u9EscQjqMwkkvz0+KE5AKusf30xlpi4xc67rxGORvKnzo/8RlDab9xI/nT5gQawHHUR+YUGNl3FDVby0+cHLgFS/7/kW8EZlzRAxiUNkHFJA2Rc0gAZ11+9G9C6B/uevwAAAABJRU5ErkJggg==",4,12,13);
global.spr_port = sprite_add_base64("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",1,47,205);
global.spr_slct = sprite_add_base64("iVBORw0KGgoAAAANSUhEUgAAABAAAAAYCAYAAADzoH0MAAAABmJLR0QA/wD/AP+gvaeTAAAACXBIWXMAAAsTAAALEwEAmpwYAAAAB3RJTUUH4AwPFCsKyolTrgAAAT5JREFUOMulVLtOhEAUPWOmNkRIiPMBJJsNW2xBY7L8gbbGxlILCxM/wJ+wcEsbY21lK6UFxVJgaOxINgHDH4yFGZwXO7icapi559wzdy6XlAtwTMABJmKyANU3ZptxxHIhCcgkFkYAAD/wBslt02G2qQAABABnYWQQ/KPwN/h7axUR5ySeJ9x2oGTURGRx6grWrfuBp8RQPcCwOlALEasI1NsKeJMKehn9ZZXExbp+qswa2HAYHCNerpAmTNm/u713CwiyDWnCVAE9uMizQbIAiecJtxFvrs/77/eP2kou8gzkJD3rHXx9lgCA04ur3qLAw+OL4abIM1BB8gPPqLYto/Ez7ep5F+LlyuzEIUHhVBewPmPbdH0dAOD1eT38CiyMuKtd/zVQxlzHGGlt043K5pyJ+4jQXfd2jTUA+AFOA3ykYEZGoAAAAABJRU5ErkJggg==",1,0,0);
global.spr_icon = sprite_add_base64("iVBORw0KGgoAAAANSUhEUgAAABcAAAAPCAYAAAAPr1RWAAAABmJLR0QA/wD/AP+gvaeTAAAACXBIWXMAAC4jAAAuIwF4pT92AAAAB3RJTUUH4AwQFDEOdbMqpQAAAdtJREFUOMudlL+O00AQxn9z9tWO4kiR0tHcgQgpKIIj0B28wEFNCkqavMe9QAooKQ5RAk9AEAjjguKMdUea6yxZiqO4t7MUjje2z4kQn7TS/pn5Zueb3YENUgellEIpRQ1qz9gabXwLHgCzdC7ZSDBdTQjAg/tDbWC3u3oeLyP8wNN2IiIbUslGsiVPnZzQmFiCm6gy4T6U7fzAUyIiqaMvJgel1AF2EseLFfEyYj7/Q7yMdgVSxsTSewU5xsSCcVJxsNtdLYXdaREvVtid1q3zwqZeLjN18miD82Muxz+BRxVd9+H2uYKxYGCRkihJHZTp5mnZ7S7xMiJerAjfzQHovTraSV62sTst7X/52yMbgaQOyvgBg/6wUWeAs5evATgd9gCYeSGf37/VctXhBx6pU5BrvRVPnr7IC/TwRBPOvFA7lgMU6+mbDwB8+/IRELiwyKYJB6aLZNOEQX/Is5MzDtdrbq6vdkox88JKMICb6ysO12u4aDHoD8mmCaa7eYqmm6cSL6PGIvq/vu5dF8UdnB/jB17xESs/FD/w6HWPmnVsINRPcvNMw2he2ZdaD9F4fPq8knYdd+7e0/Pvs0/U+oyIyJa8aDYiovhPKKWk1GsqN2/qhv+KRp6/QpffY2TvLhoAAAAASUVORK5CYII=",1,11,7);
global.spr_ult[1] = sprite_add_base64("iVBORw0KGgoAAAANSUhEUgAAABgAAAAgCAYAAAAIXrg4AAAABmJLR0QA/wD/AP+gvaeTAAAACXBIWXMAAC4jAAAuIwF4pT92AAAAB3RJTUUH4AwQFSMvQOwgHwAAAB1pVFh0Q29tbWVudAAAAAAAQ3JlYXRlZCB3aXRoIEdJTVBkLmUHAAACTUlEQVRIx7VWQUsbQRh9G6MiWDe4gdjc1dK4gh62KbFRTOktrbeC/gAVvOjBHyHoyYM/oAV78aC3okgWCiGH9JBKS3PoLSUlGxI9tEhkekhmndmd2d0k+kFImJ28933ve/PtKNOjIwRMXM38ReLbCLuEieEh9BohFhgABz4xPNQXOEfwWBGi2Q9sqQ+aOY0w/fFs47ZnvXNWU/pMYZscBFwEFo9NySsQucYLmIJp0YhwnzYe4ytoJUEAIFNWfYFloDJwAAiJsr+YbNrg8dgU9IThCx7IphQ4U1aRs5pdA1v1Kqx61d0DJ0k4D+gJo2drsiRcBZmy2je4SyJ6wC4mm7bmD3uS13hfyzS3ag2XY+hH5iBbIlqFTBqr1uCInWAy8Pao+Kh6N8wB7mwiS6CNx1zP2k3uyPT1SaFv17hmESGwZ9HdS2Dupn8HsVWHWInYkS1rbpDQohH7f0orCfJ6MItL8wwAMDtjdEXg5TotGrkfdm2S0w7JCyHJ85MGwslr7HbWlwf+Saeri2DuxuDsJmqcVWtwJHsAWvkxnKf+cNOWrVohH1RCXeSUx6+RNN6urmPRiPu5qP21sLSC69rvrsDZcBIpS6+y3L3o0jzF5s4BAODL508AgLHoU+jzaXtPqWji14/vLnBhBXrCIM4TadWrSL1575nZ4dExR+pLIBoJzsxZklyhIgVl9ylUfNk7t3RVQGrxnYtIRCBaVwAQr3dApfoTG9v7KBXNQJL0dHUsFU3fNZlNAxEEyfzw6Nj76thtBXRdn0/bz0X7/gNGJvY3HOCOCAAAAABJRU5ErkJggg==",1,12,16);
global.spr_ult[2] = sprite_add_base64("iVBORw0KGgoAAAANSUhEUgAAABgAAAAgCAYAAAAIXrg4AAAABmJLR0QA/wD/AP+gvaeTAAAACXBIWXMAAC4jAAAuIwF4pT92AAAAB3RJTUUH4AwQASwwUVM6iQAAAB1pVFh0Q29tbWVudAAAAAAAQ3JlYXRlZCB3aXRoIEdJTVBkLmUHAAACeUlEQVRIx7VWTWsTURQ9ycQWxTAhE0iZgMRFs6lZNMhgEWYIgq5cu+gfcJFNXYoL/QEVFwHTHxDJ2n2hk41tkAhNiyUKRaGhgZkyQ8Bga1sXkzedj/dmXtP2wsDw3rx77rnnvnsnoUniOaa0w7/Hsd8kcQWbm53B3OzMzQHw2LUARDFJAGBqoEnilXVJyPkSE2Aw7E8FSkB2H4yRknIZ5odSTnHfTcMCAOgTUF52ifKCEmIgZfPMA+bREKZhuexYQIRF6jLOvftSToFpWNCH/Ug2SWqEkyfOpFwG5QUFumm7a+vzdnyKprHebifEZH3evr6LFmRyIzdZzpdCICmegzThaRpJuQx+3wee/HDSI9TEeAasqqKtf0t3QkIzRZayea5KMg0L3stKQGI14HFOs8WRAqEmQqiJfg2CkfBaMPrFkQIsOykSIDoA0zpnpqjpRH9at+OriDQ5WuS0wIQvAGCjqj4HbkWUKXF8cDhp2Z6o7u2XGM4n9dLMuDr65gE5QLrlv0dwxFq2gaboOqel01u2pEBMw0Li5crqOQBoiuw7oHcG+PxpjSpm1L0wj4bY3nFK9XRpUqZB52Rt9cM7LufE8Ukyie2dLXcKCzXxggENwMskCuTx0xcAgI/vXwHNDKpranwv0jsDH7PXb1Z8+/VGC+XKhaO9rxuoqhsAVN8lFR4uPXurKTKKhTSKhTR+HYzcTfJ+fPIH47MsioW0uzc+yzpzoNvGz94m7ty+G+oAPpG9qdE7g8h8a4qMeqOF/b3v1NR5Z3YyLjXMAVNRMRj2YRpW6CGzgXvg9LrtUP6Da5f6daw3WlwMeCzFiqTXbaNcURG1z2P/ATF/JRhKqt4tAAAAAElFTkSuQmCC",1,12,16);

 // Define Global Ultra Variables:
global.ultra[1] = 0;
global.ultra[2] = 0;

 // Don't Detonate:
global.NoDetonate[0] = Laser;
global.NoDetonate[1] = Lightning;
global.NoDetonate[2] = EnergyShank;
global.NoDetonate[3] = EnergySlash;
global.NoDetonate[4] = EnergyHammerSlash;
global.NoDetonate[5] = EnemyLaser;
global.NoDetonate[6] = EnemyLightning;


#define create // Load When Player is Created
 // Sprites:
spr_idle = global.spr_idle;
spr_walk = global.spr_walk;
spr_hurt = global.spr_hurt;
spr_dead = global.spr_dead;

 // Sounds:
snd_wrld = sndMutant1Wrld;			// LET'S DO THIS
snd_hurt = sndSuperFireballerHurt;	// THE WIND HURTS
snd_dead = sndNecromancerDead;		// YOU DID NOT REACH THE NUCLEAR THRONE
snd_lowa = sndMutant1LowA;			// ALWAYS KEEP ONE EYE ON YOUR AMMO
snd_lowh = sndMutant1LowH;			// THIS ISN'T GOING TO END WELL
snd_chst = sndMutant1Chst;			// COOL
snd_valt = sndMutant1Valt;			// AWWW YES
snd_crwn = sndMutant1Crwn;			// CROWNS ARE LOYAL
snd_spch = sndMutant1Spch;			// YOU REACHED THE NUCLEAR THRONE
snd_idpd = sndMutant1IDPD;			// BEYOND THE PORTAL
snd_cptn = sndMutant1Cptn;			// THE STRUGGLE IS OVER

#define step // Load Every Frame
spr_idle = global.spr_idle;
spr_walk = global.spr_walk;
spr_hurt = global.spr_hurt;
spr_dead = global.spr_dead;

 // Active : Detonate Projectiles
with(projectile){

	 // Set Projectile Type:
	if("projtype" not in self){
		if(team != other.team) projtype = 1;
		else{
			if(creator = other){
				projtype = weapon_get_type(other.wep);
				if(object_index = PlasmaBall || object_index = PlasmaBig || object_index = PlasmaHuge) projtype = 5;
			}
		}
		dettimer = 5;
		for(i = 0; i < array_length_1d(global.NoDetonate); i++){
			with(global.NoDetonate[i]) projtype = 0;
		}
	}
	else{
	
		 // Detonate Projectiles:
		if button_check(other.index,"spec") && point_in_rectangle(x, y, view_xview[other.index], view_yview[other.index], view_xview[other.index] + 320, view_yview[other.index] + 240){
			if team = other.team || object_index = Disc && creator = other || global.ultra[1] = 1 && damage < 3{ // Ultra A : Gamma Burst - Explode Enemy Projectiles With <3 Damage

				if("dettimer" in self && dettimer > 0){
					dettimer --;
				}
				if("dettimer" in self && dettimer = 0 || button_pressed(other.index,"spec")){
					 // Melee : Can't Detonate
					if(projtype = 0 && team = other.team) sound_play(sndFlamerStop);

					 // Bullets, Shells, and Bolts : Can Detonate
					if projtype = 1 || projtype = 2 || projtype = 3{ 	
						if damage < 7{
							if(global.ultra[2] = 1){ // Ultra B : Blood Burst - Detonate Blood Explosions Instead Of Normal Ones
								instance_create(x + lengthdir_x(speed,direction),y + lengthdir_y(speed,direction),MeatExplosion);
								with instance_create(x + lengthdir_x(speed,direction),y + lengthdir_y(speed,direction),MeltSplat) depth = 2;
							}
							else instance_create(x + lengthdir_x(speed,direction),y + lengthdir_y(speed,direction),SmallExplosion);
							sound_play(sndExplosionS);
						}
						if damage > 6 && damage < 25{
							if(global.ultra[2] = 1){ // Ultra B : Blood Burst - Detonate Blood Explosions Instead Of Normal Ones
								ang = random(360);
								repeat(3){
									instance_create(x + lengthdir_x(24,direction + ang),y + lengthdir_y(24,direction + ang),MeatExplosion);
									ang += 120;
								}
								with instance_create(x,y,MeltSplat){
									sprite_index = sprMeltSplatBig;
									depth = 2;
								}
							}
							else instance_create(x + lengthdir_x(speed,direction),y + lengthdir_y(speed,direction),Explosion);
							sound_play(sndExplosion);
						}
						if damage > 24{
							if(global.ultra[2] = 1){ // Ultra B : Blood Burst - Detonate Blood Explosions Instead Of Normal Ones
								ang = random(360);
								repeat(5){
									instance_create(x + lengthdir_x(24,direction + ang),y + lengthdir_y(24,direction + ang),MeatExplosion);
									ang += 72;
								}
								instance_create(x,y,MeatExplosion);
								with instance_create(x,y,MeltSplat){
									sprite_index = sprMeltSplatBig;
									depth = 2;
									image_xscale = 1.2;
									image_yscale = image_xscale;
								}
							}
							else instance_create(x + lengthdir_x(speed,direction),y + lengthdir_y(speed,direction),GreenExplosion);
							sound_play(sndExplosionL);
						}
						if(global.ultra[2] = 1) sound_play(sndBloodLauncherExplo);
						instance_destroy();
						if other.reload < weapon_get_load(other.wep)*4 other.reload +=2;
					}

					 // Explosives : Can Detonate, Except For Jackhammer Slashes
					if instance_exists(self) && projtype = 4{ 			
						if(object_index = Flame){
							if(global.ultra[2] = 1){
								instance_create(x + lengthdir_x(speed,direction),y + lengthdir_y(speed,direction),MeatExplosion);
								sound_play(sndCorpseExplo);
							}
							else instance_create(x + lengthdir_x(speed,direction),y + lengthdir_y(speed,direction),SmallExplosion);
							sound_play(sndExplosionS);
						}
						if(object_index = Shank) sound_play(sndFlamerStop);
						else{
							instance_destroy();
							if other.reload < weapon_get_load(other.wep)*4 other.reload += 2;
						}
					}

					 // Energy : Plasma Can Detonate Into Plasma Explosions
					if instance_exists(self) && projtype = 5{			
						if(object_index = PlasmaBall || object_index = PlasmaBig || object_index = PlasmaHuge) instance_create(x,y,PlasmaImpact);
						instance_destroy();
						if other.reload < weapon_get_load(other.wep)*4 other.reload += 2;
					}
				}
			}
		}
	}
}
with(BoltStick){ // Bolts Stuck in Enemies Can Explode Into Small Explosions:
	if button_check(other.index,"spec") && point_in_rectangle(x, y, view_xview[other.index], view_yview[other.index], view_xview[other.index] + 320, view_yview[other.index] + 240){
		if(global.ultra[2] = 1){
			instance_create(x + lengthdir_x(speed,direction),y + lengthdir_y(speed,direction),MeatExplosion);
			instance_create(x + lengthdir_x(speed,direction),y + lengthdir_y(speed,direction),MeltSplat);
			sound_play(sndBloodLauncherExplo);
		}
		else instance_create(x,y,SmallExplosion);
		sound_play(sndExplosionS);
		instance_destroy();
		if other.reload < weapon_get_load(other.wep)*4 other.reload += 2;
	}
}

 // Thronebutt : Explosions Last 20% Longer
if skill_get(5){
	with(Explosion) image_speed = 0.32;
	with(MeatExplosion) image_speed = 0.32;
}

 // Passive : Flame Resistance (Just Don't Stand Too Close To The Origin Point Of Flame, Dunno How to Fix That)
with(TrapFire){
	if(distance_to_object(other) < 15) instance_destroy();
}


 // Portrait:
#define race_portrait
return global.spr_port;

 // Character Selection Icon:
#define race_menu_button
sprite_index = global.spr_slct;

 // Map Icon:
#define race_mapicon
return global.spr_icon;

 // Name:
#define race_name
return "DETONATOR";

 // Character Description:
#define race_text
return "@rFLAME @wRESISTANCE#EXPLODE PROJECTILES"

 // Thronebutt Description:
#define race_tb_text
return "@rEXPLOSIONS @sLAST @wLONGER"

 // Ultra Icons:
#define race_ultra_button
sprite_index = global.spr_ult[argument0];

 // Ultra Names:
#define race_ultra_name
switch (argument0){
	case 1: return "GAMMA BURST";
	case 2: return "BLOOD BURST";
}

 // Ultra Descriptions:
#define race_ultra_text
switch (argument0){
	case 1: return "@rDETONATE @sWEAKER @wENEMY PROJECTILES";
	case 2: return "@rBLOODY @sDETONATIONS";
}

 // When An Ultra Is Taken:
#define race_ultra_take
global.ultra[argument0] = 1;
sound_play(sndBasicUltra);
sound_play(sndMeltingUltraA);