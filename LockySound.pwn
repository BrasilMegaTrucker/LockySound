#include a_samp
#include zcmd

#define DialogRadio     2750

enum iWebRadios
{
    NomeWebRadio[100],
    ipWebRadio[128]
}
new WebRadios[][iWebRadios] =
{
    {"{ffff00}Rádio Brasil Mega Trucker", "http://radio.brasilmegatrucker.com:10698"},
    {"Sound Pop", "http://173.193.202.68:7460/"},
    {"All Hits Station", "http://199.195.192.234:9998/"},
    {"Mega Som", "http://174.142.196.188:8048/"},
    {"Rádio Dance", "http://173.193.201.100:8068/"},
    {"Radio Hunter", "http://listen.shoutcast.com:80/RadioHunter-TheHitzChannel"},
    {"Rap 181 FM", "http://108.61.73.117:8054/"},
    {"Flow 103", "http://173.245.71.186:80/"},
    {"Dance Hits Chicago", "http://wms-21.streamsrus.com:10025/"},
    {"Forró", "http://64.15.147.220:7120/"},
    {"Som Sertanejo", "http://64.15.147.221:12016/"},
    {"Funk Neurótico", "http://64.56.64.76:16506/"},
    {"Radio Mandela Digital", "http://184.154.37.136:12842/"},
    {"Rádio Rock", "http://suaradio1.dyndns.ws:10584/stream"},
    {"Reggaeton 24/7", "http://192.81.248.32:8160/"},
    {"Hot Hits", "http://206.217.213.235:8290/"},
    {"Radio DUBSTEP", "http://stream.dubstep.fm:80/256mp3"},
    {"Radio HIP-HOP", "http://108.61.30.179:4010"},
    {"Radio REGGAE", "http://176.31.246.143:8300/"}
};
CMD:radios(playerid, params[])
{
    new Radios[2000];
    for(new i; i < sizeof(WebRadios); i++)
        if(strlen(WebRadios[i][NomeWebRadio]) > 0)
            format(Radios, sizeof(Radios), "%s%s\r\n", Radios,WebRadios[i][NomeWebRadio]);
    format(Radios, sizeof(Radios), "%s{ff0000}Desligar rádio\r\n", Radios);
    return ShowPlayerDialog(playerid, DialogRadio, DIALOG_STYLE_LIST, "Web Rádios", Radios, "Escolher", "Cancelar");
}
public OnDialogResponse(playerid, dialogid, response, listitem, inputtext[]) {
    if(dialogid == DialogRadio) {
        if(!response) return 1;
        new radio = listitem;
        if(radio < sizeof(WebRadios) && strlen(WebRadios[radio][NomeWebRadio]) > 0)
        {
            new Msg[144];
            PlayAudioStreamForPlayer(playerid, WebRadios[radio][ipWebRadio]);
            format(Msg, 144, "{a9c4e4}Você está ouvindo: {ffffff}%s{a9c4e4}.", WebRadios[radio][NomeWebRadio]);
            SendClientMessage(playerid, -1, Msg);
        } else {
            StopAudioStreamForPlayer(playerid);
            SendClientMessage(playerid, -1, "{a9c4e4}Som {ffffff}parado!");
        }
        return 1;
    }
    return 1;
}
/*
    Retirado do GM Mega Freeroam (Feito por Nícolas Corrêa ~ Locky)
    Autoria Mega Freeroam: Brasil Mega Trucker
*/
