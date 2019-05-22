enum RoleType { werewolf, seer, witch, hunter }
enum ActionType { kill, heal, protect, bind, see }

Map<RoleType, ModelRole> modelRoleMap = new Map();

class ModelRole {
  RoleType roleType;
  String description;
  String image;
  int count  ;
  ModelRole({
    this.roleType,
    this.description= "",
    this.image = "",
    this.count = 0,
  });
}

class ModelPlayer {
  String name;
  ModelRole role;
  bool isDead;
  ModelPlayer({
    this.name,
    this.role,
    this.isDead = false,
  });
}


class ModelHistoric {
  final ModelPlayer currentPlayer;
  final ModelPlayer targetPlayer;
  final ActionType action;

  ModelHistoric({
    this.currentPlayer,
    this.targetPlayer,
    this.action
  });

}


/*
class VoteAction {
  Map < String, String > vote;
  final List < PlayerModel > players;
  VoteAction({
    this.players
  });

  void add(String name, target) {
    vote[name] = target;
  }

  String result() {
    String victim;

    vote.forEach((key, value) {
      players.forEach((player) {
        if (player.name == value)
          //player.vote++;
      });
    });
    int max = 0;
    int maxNumberFound = 0;
    
    //get max vote
    players.forEach((player) {
      if (player.vote > max)
        max = player.vote;
    });
    //get if the max is uniq or not
    players.forEach((player) {
      if (player.vote == max)
        maxNumberFound++;
    });
    
    //if max is uniq get the name
    if (maxNumberFound == 1) {
      players.forEach((player) {
        if (player.vote == max)
          victim = player.name;
      });
    }
    return victim;
  }

}
*/