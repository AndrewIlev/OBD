from sqlalchemy.orm import Session
from datetime import date
from . import models, schemas

# ===== Guild =====
def get_guilds(db: Session):
    return db.query(models.Guild).all()

def create_guild(db: Session, guild: schemas.GuildCreate):
    db_guild = models.Guild(
        name=guild.name,
        rating=guild.rating,
        created_at=date.today()
    )
    db.add(db_guild)
    db.commit()
    db.refresh(db_guild)
    return db_guild

# ===== Player =====
def get_players(db: Session):
    return db.query(models.Player).all()

def create_player(db: Session, player: schemas.PlayerCreate):
    db_player = models.Player(**player.dict())
    db.add(db_player)
    db.commit()
    db.refresh(db_player)
    return db_player

# ===== Quest =====
def get_quests(db: Session):
    return db.query(models.Quest).all()

def create_quest(db: Session, quest: schemas.QuestCreate):
    db_quest = models.Quest(**quest.dict())
    db.add(db_quest)
    db.commit()
    db.refresh(db_quest)
    return db_quest

# ===== Item =====
def get_items(db: Session):
    return db.query(models.Item).all()

def create_item(db: Session, item: schemas.ItemCreate):
    db_item = models.Item(**item.dict())
    db.add(db_item)
    db.commit()
    db.refresh(db_item)
    return db_item

# ===== Skill =====
def get_skills(db: Session):
    return db.query(models.Skill).all()

def create_skill(db: Session, skill: schemas.SkillCreate):
    db_skill = models.Skill(**skill.dict())
    db.add(db_skill)
    db.commit()
    db.refresh(db_skill)
    return db_skill

# ===== Achievement =====
def get_achievements(db: Session):
    return db.query(models.Achievement).all()

def create_achievement(db: Session, achievement: schemas.AchievementCreate):
    db_achievement = models.Achievement(**achievement.dict())
    db.add(db_achievement)
    db.commit()
    db.refresh(db_achievement)
    return db_achievement

# ===== MathGame =====
def get_mathgames(db: Session):
    return db.query(models.MathGame).all()

def create_mathgame(db: Session, mathgame: schemas.MathGameCreate):
    db_mathgame = models.MathGame(**mathgame.dict())
    db.add(db_mathgame)
    db.commit()
    db.refresh(db_mathgame)
    return db_mathgame

