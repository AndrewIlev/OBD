from sqlalchemy import Column, Integer, String, Date, Text, ForeignKey
from sqlalchemy.orm import relationship
from .database import Base

# ===== Guild =====
class Guild(Base):
    __tablename__ = "Guild"
    guild_id = Column(Integer, primary_key=True, index=True)
    name = Column(String(50), nullable=False)
    rating = Column(Integer, default=0)
    created_at = Column(Date)

    players = relationship("Player", back_populates="guild")

# ===== Player =====
class Player(Base):
    __tablename__ = "Player"
    player_id = Column(Integer, primary_key=True, index=True)
    login = Column(String(50), nullable=False)
    nickname = Column(String(50))
    email = Column(String(100))
    level = Column(Integer, default=1)
    xp = Column(Integer, default=0)
    guild_id = Column(Integer, ForeignKey("Guild.guild_id", ondelete="SET NULL"))

    guild = relationship("Guild", back_populates="players")
    inventory_items = relationship("Inventory", back_populates="player")
    quests = relationship("PlayerQuest", back_populates="player")
    skills = relationship("PlayerSkill", back_populates="player")
    achievements = relationship("PlayerAchievement", back_populates="player")
    mathgames = relationship("PlayerMathGame", back_populates="player")

# ===== Quest =====
class Quest(Base):
    __tablename__ = "Quest"
    quest_id = Column(Integer, primary_key=True, index=True)
    title = Column(String(100), nullable=False)
    description = Column(Text)
    reward = Column(String(100))
    difficulty = Column(String(20))

    players = relationship("PlayerQuest", back_populates="quest")

# ===== Item =====
class Item(Base):
    __tablename__ = "Item"
    item_id = Column(Integer, primary_key=True, index=True)
    name = Column(String(50), nullable=False)
    item_type = Column(String(30))
    rarity = Column(String(30))
    price = Column(Integer, default=0)

    players = relationship("Inventory", back_populates="item")

# ===== Skill =====
class Skill(Base):
    __tablename__ = "Skill"
    skill_id = Column(Integer, primary_key=True, index=True)
    name = Column(String(50), nullable=False)
    level = Column(Integer, default=1)
    effect = Column(String(100))

    players = relationship("PlayerSkill", back_populates="skill")

# ===== Achievement =====
class Achievement(Base):
    __tablename__ = "Achievement"
    achievement_id = Column(Integer, primary_key=True, index=True)
    name = Column(String(50), nullable=False)
    description = Column(Text)
    condition_text = Column(String(100))

    players = relationship("PlayerAchievement", back_populates="achievement")

# ===== MathGame =====
class MathGame(Base):
    __tablename__ = "MathGame"
    match_id = Column(Integer, primary_key=True, index=True)
    match_date = Column(Date)
    match_type = Column(String(30))
    result = Column(String(30))

    players = relationship("PlayerMathGame", back_populates="match")

# ===== Association Tables =====
class Inventory(Base):
    __tablename__ = "Inventory"
    player_id = Column(Integer, ForeignKey("Player.player_id", ondelete="CASCADE"), primary_key=True)
    item_id = Column(Integer, ForeignKey("Item.item_id", ondelete="CASCADE"), primary_key=True)
    quantity = Column(Integer, default=1)

    player = relationship("Player", back_populates="inventory_items")
    item = relationship("Item", back_populates="players")

class PlayerQuest(Base):
    __tablename__ = "PlayerQuest"
    player_id = Column(Integer, ForeignKey("Player.player_id", ondelete="CASCADE"), primary_key=True)
    quest_id = Column(Integer, ForeignKey("Quest.quest_id", ondelete="CASCADE"), primary_key=True)

    player = relationship("Player", back_populates="quests")
    quest = relationship("Quest", back_populates="players")

class PlayerSkill(Base):
    __tablename__ = "PlayerSkill"
    player_id = Column(Integer, ForeignKey("Player.player_id", ondelete="CASCADE"), primary_key=True)
    skill_id = Column(Integer, ForeignKey("Skill.skill_id", ondelete="CASCADE"), primary_key=True)

    player = relationship("Player", back_populates="skills")
    skill = relationship("Skill", back_populates="players")

class PlayerAchievement(Base):
    __tablename__ = "PlayerAchievement"
    player_id = Column(Integer, ForeignKey("Player.player_id", ondelete="CASCADE"), primary_key=True)
    achievement_id = Column(Integer, ForeignKey("Achievement.achievement_id", ondelete="CASCADE"), primary_key=True)

    player = relationship("Player", back_populates="achievements")
    achievement = relationship("Achievement", back_populates="players")

class PlayerMathGame(Base):
    __tablename__ = "PlayerMathGame"
    player_id = Column(Integer, ForeignKey("Player.player_id", ondelete="CASCADE"), primary_key=True)
    match_id = Column(Integer, ForeignKey("MathGame.match_id", ondelete="CASCADE"), primary_key=True)

    player = relationship("Player", back_populates="mathgames")
    match = relationship("MathGame", back_populates="players")
