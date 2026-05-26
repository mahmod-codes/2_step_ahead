// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $UsersTableTable extends UsersTable
    with TableInfo<$UsersTableTable, UsersTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $UsersTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _firebaseUidMeta = const VerificationMeta(
    'firebaseUid',
  );
  @override
  late final GeneratedColumn<String> firebaseUid = GeneratedColumn<String>(
    'firebase_uid',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'),
  );
  static const VerificationMeta _emailMeta = const VerificationMeta('email');
  @override
  late final GeneratedColumn<String> email = GeneratedColumn<String>(
    'email',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<int> createdAt = GeneratedColumn<int>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [id, firebaseUid, email, createdAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'users_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<UsersTableData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('firebase_uid')) {
      context.handle(
        _firebaseUidMeta,
        firebaseUid.isAcceptableOrUnknown(
          data['firebase_uid']!,
          _firebaseUidMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_firebaseUidMeta);
    }
    if (data.containsKey('email')) {
      context.handle(
        _emailMeta,
        email.isAcceptableOrUnknown(data['email']!, _emailMeta),
      );
    } else if (isInserting) {
      context.missing(_emailMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  UsersTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return UsersTableData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      firebaseUid: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}firebase_uid'],
      )!,
      email: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}email'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $UsersTableTable createAlias(String alias) {
    return $UsersTableTable(attachedDatabase, alias);
  }
}

class UsersTableData extends DataClass implements Insertable<UsersTableData> {
  final int id;
  final String firebaseUid;
  final String email;
  final int createdAt;
  const UsersTableData({
    required this.id,
    required this.firebaseUid,
    required this.email,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['firebase_uid'] = Variable<String>(firebaseUid);
    map['email'] = Variable<String>(email);
    map['created_at'] = Variable<int>(createdAt);
    return map;
  }

  UsersTableCompanion toCompanion(bool nullToAbsent) {
    return UsersTableCompanion(
      id: Value(id),
      firebaseUid: Value(firebaseUid),
      email: Value(email),
      createdAt: Value(createdAt),
    );
  }

  factory UsersTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return UsersTableData(
      id: serializer.fromJson<int>(json['id']),
      firebaseUid: serializer.fromJson<String>(json['firebaseUid']),
      email: serializer.fromJson<String>(json['email']),
      createdAt: serializer.fromJson<int>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'firebaseUid': serializer.toJson<String>(firebaseUid),
      'email': serializer.toJson<String>(email),
      'createdAt': serializer.toJson<int>(createdAt),
    };
  }

  UsersTableData copyWith({
    int? id,
    String? firebaseUid,
    String? email,
    int? createdAt,
  }) => UsersTableData(
    id: id ?? this.id,
    firebaseUid: firebaseUid ?? this.firebaseUid,
    email: email ?? this.email,
    createdAt: createdAt ?? this.createdAt,
  );
  UsersTableData copyWithCompanion(UsersTableCompanion data) {
    return UsersTableData(
      id: data.id.present ? data.id.value : this.id,
      firebaseUid: data.firebaseUid.present
          ? data.firebaseUid.value
          : this.firebaseUid,
      email: data.email.present ? data.email.value : this.email,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('UsersTableData(')
          ..write('id: $id, ')
          ..write('firebaseUid: $firebaseUid, ')
          ..write('email: $email, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, firebaseUid, email, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UsersTableData &&
          other.id == this.id &&
          other.firebaseUid == this.firebaseUid &&
          other.email == this.email &&
          other.createdAt == this.createdAt);
}

class UsersTableCompanion extends UpdateCompanion<UsersTableData> {
  final Value<int> id;
  final Value<String> firebaseUid;
  final Value<String> email;
  final Value<int> createdAt;
  const UsersTableCompanion({
    this.id = const Value.absent(),
    this.firebaseUid = const Value.absent(),
    this.email = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  UsersTableCompanion.insert({
    this.id = const Value.absent(),
    required String firebaseUid,
    required String email,
    required int createdAt,
  }) : firebaseUid = Value(firebaseUid),
       email = Value(email),
       createdAt = Value(createdAt);
  static Insertable<UsersTableData> custom({
    Expression<int>? id,
    Expression<String>? firebaseUid,
    Expression<String>? email,
    Expression<int>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (firebaseUid != null) 'firebase_uid': firebaseUid,
      if (email != null) 'email': email,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  UsersTableCompanion copyWith({
    Value<int>? id,
    Value<String>? firebaseUid,
    Value<String>? email,
    Value<int>? createdAt,
  }) {
    return UsersTableCompanion(
      id: id ?? this.id,
      firebaseUid: firebaseUid ?? this.firebaseUid,
      email: email ?? this.email,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (firebaseUid.present) {
      map['firebase_uid'] = Variable<String>(firebaseUid.value);
    }
    if (email.present) {
      map['email'] = Variable<String>(email.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<int>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UsersTableCompanion(')
          ..write('id: $id, ')
          ..write('firebaseUid: $firebaseUid, ')
          ..write('email: $email, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

class $ProjectsTableTable extends ProjectsTable
    with TableInfo<$ProjectsTableTable, ProjectsTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ProjectsTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<int> userId = GeneratedColumn<int>(
    'user_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES users_table (id)',
    ),
  );
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
    'title',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _rawIdeaMeta = const VerificationMeta(
    'rawIdea',
  );
  @override
  late final GeneratedColumn<String> rawIdea = GeneratedColumn<String>(
    'raw_idea',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
    'status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<int> createdAt = GeneratedColumn<int>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    userId,
    title,
    rawIdea,
    status,
    createdAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'projects_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<ProjectsTableData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('user_id')) {
      context.handle(
        _userIdMeta,
        userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta),
      );
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
        _titleMeta,
        title.isAcceptableOrUnknown(data['title']!, _titleMeta),
      );
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('raw_idea')) {
      context.handle(
        _rawIdeaMeta,
        rawIdea.isAcceptableOrUnknown(data['raw_idea']!, _rawIdeaMeta),
      );
    }
    if (data.containsKey('status')) {
      context.handle(
        _statusMeta,
        status.isAcceptableOrUnknown(data['status']!, _statusMeta),
      );
    } else if (isInserting) {
      context.missing(_statusMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ProjectsTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ProjectsTableData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      userId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}user_id'],
      )!,
      title: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}title'],
      )!,
      rawIdea: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}raw_idea'],
      ),
      status: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}status'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $ProjectsTableTable createAlias(String alias) {
    return $ProjectsTableTable(attachedDatabase, alias);
  }
}

class ProjectsTableData extends DataClass
    implements Insertable<ProjectsTableData> {
  final int id;
  final int userId;
  final String title;
  final String? rawIdea;
  final String status;
  final int createdAt;
  const ProjectsTableData({
    required this.id,
    required this.userId,
    required this.title,
    this.rawIdea,
    required this.status,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['user_id'] = Variable<int>(userId);
    map['title'] = Variable<String>(title);
    if (!nullToAbsent || rawIdea != null) {
      map['raw_idea'] = Variable<String>(rawIdea);
    }
    map['status'] = Variable<String>(status);
    map['created_at'] = Variable<int>(createdAt);
    return map;
  }

  ProjectsTableCompanion toCompanion(bool nullToAbsent) {
    return ProjectsTableCompanion(
      id: Value(id),
      userId: Value(userId),
      title: Value(title),
      rawIdea: rawIdea == null && nullToAbsent
          ? const Value.absent()
          : Value(rawIdea),
      status: Value(status),
      createdAt: Value(createdAt),
    );
  }

  factory ProjectsTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ProjectsTableData(
      id: serializer.fromJson<int>(json['id']),
      userId: serializer.fromJson<int>(json['userId']),
      title: serializer.fromJson<String>(json['title']),
      rawIdea: serializer.fromJson<String?>(json['rawIdea']),
      status: serializer.fromJson<String>(json['status']),
      createdAt: serializer.fromJson<int>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'userId': serializer.toJson<int>(userId),
      'title': serializer.toJson<String>(title),
      'rawIdea': serializer.toJson<String?>(rawIdea),
      'status': serializer.toJson<String>(status),
      'createdAt': serializer.toJson<int>(createdAt),
    };
  }

  ProjectsTableData copyWith({
    int? id,
    int? userId,
    String? title,
    Value<String?> rawIdea = const Value.absent(),
    String? status,
    int? createdAt,
  }) => ProjectsTableData(
    id: id ?? this.id,
    userId: userId ?? this.userId,
    title: title ?? this.title,
    rawIdea: rawIdea.present ? rawIdea.value : this.rawIdea,
    status: status ?? this.status,
    createdAt: createdAt ?? this.createdAt,
  );
  ProjectsTableData copyWithCompanion(ProjectsTableCompanion data) {
    return ProjectsTableData(
      id: data.id.present ? data.id.value : this.id,
      userId: data.userId.present ? data.userId.value : this.userId,
      title: data.title.present ? data.title.value : this.title,
      rawIdea: data.rawIdea.present ? data.rawIdea.value : this.rawIdea,
      status: data.status.present ? data.status.value : this.status,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ProjectsTableData(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('title: $title, ')
          ..write('rawIdea: $rawIdea, ')
          ..write('status: $status, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, userId, title, rawIdea, status, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ProjectsTableData &&
          other.id == this.id &&
          other.userId == this.userId &&
          other.title == this.title &&
          other.rawIdea == this.rawIdea &&
          other.status == this.status &&
          other.createdAt == this.createdAt);
}

class ProjectsTableCompanion extends UpdateCompanion<ProjectsTableData> {
  final Value<int> id;
  final Value<int> userId;
  final Value<String> title;
  final Value<String?> rawIdea;
  final Value<String> status;
  final Value<int> createdAt;
  const ProjectsTableCompanion({
    this.id = const Value.absent(),
    this.userId = const Value.absent(),
    this.title = const Value.absent(),
    this.rawIdea = const Value.absent(),
    this.status = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  ProjectsTableCompanion.insert({
    this.id = const Value.absent(),
    required int userId,
    required String title,
    this.rawIdea = const Value.absent(),
    required String status,
    required int createdAt,
  }) : userId = Value(userId),
       title = Value(title),
       status = Value(status),
       createdAt = Value(createdAt);
  static Insertable<ProjectsTableData> custom({
    Expression<int>? id,
    Expression<int>? userId,
    Expression<String>? title,
    Expression<String>? rawIdea,
    Expression<String>? status,
    Expression<int>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (userId != null) 'user_id': userId,
      if (title != null) 'title': title,
      if (rawIdea != null) 'raw_idea': rawIdea,
      if (status != null) 'status': status,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  ProjectsTableCompanion copyWith({
    Value<int>? id,
    Value<int>? userId,
    Value<String>? title,
    Value<String?>? rawIdea,
    Value<String>? status,
    Value<int>? createdAt,
  }) {
    return ProjectsTableCompanion(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      title: title ?? this.title,
      rawIdea: rawIdea ?? this.rawIdea,
      status: status ?? this.status,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<int>(userId.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (rawIdea.present) {
      map['raw_idea'] = Variable<String>(rawIdea.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<int>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ProjectsTableCompanion(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('title: $title, ')
          ..write('rawIdea: $rawIdea, ')
          ..write('status: $status, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

class $QuestionnaireResponsesTableTable extends QuestionnaireResponsesTable
    with
        TableInfo<
          $QuestionnaireResponsesTableTable,
          QuestionnaireResponsesTableData
        > {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $QuestionnaireResponsesTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _projectIdMeta = const VerificationMeta(
    'projectId',
  );
  @override
  late final GeneratedColumn<int> projectId = GeneratedColumn<int>(
    'project_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'UNIQUE REFERENCES projects_table (id)',
    ),
  );
  static const VerificationMeta _answersJsonMeta = const VerificationMeta(
    'answersJson',
  );
  @override
  late final GeneratedColumn<String> answersJson = GeneratedColumn<String>(
    'answers_json',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<int> updatedAt = GeneratedColumn<int>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [id, projectId, answersJson, updatedAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'questionnaire_responses_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<QuestionnaireResponsesTableData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('project_id')) {
      context.handle(
        _projectIdMeta,
        projectId.isAcceptableOrUnknown(data['project_id']!, _projectIdMeta),
      );
    } else if (isInserting) {
      context.missing(_projectIdMeta);
    }
    if (data.containsKey('answers_json')) {
      context.handle(
        _answersJsonMeta,
        answersJson.isAcceptableOrUnknown(
          data['answers_json']!,
          _answersJsonMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_answersJsonMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  QuestionnaireResponsesTableData map(
    Map<String, dynamic> data, {
    String? tablePrefix,
  }) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return QuestionnaireResponsesTableData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      projectId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}project_id'],
      )!,
      answersJson: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}answers_json'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}updated_at'],
      )!,
    );
  }

  @override
  $QuestionnaireResponsesTableTable createAlias(String alias) {
    return $QuestionnaireResponsesTableTable(attachedDatabase, alias);
  }
}

class QuestionnaireResponsesTableData extends DataClass
    implements Insertable<QuestionnaireResponsesTableData> {
  final int id;
  final int projectId;
  final String answersJson;
  final int updatedAt;
  const QuestionnaireResponsesTableData({
    required this.id,
    required this.projectId,
    required this.answersJson,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['project_id'] = Variable<int>(projectId);
    map['answers_json'] = Variable<String>(answersJson);
    map['updated_at'] = Variable<int>(updatedAt);
    return map;
  }

  QuestionnaireResponsesTableCompanion toCompanion(bool nullToAbsent) {
    return QuestionnaireResponsesTableCompanion(
      id: Value(id),
      projectId: Value(projectId),
      answersJson: Value(answersJson),
      updatedAt: Value(updatedAt),
    );
  }

  factory QuestionnaireResponsesTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return QuestionnaireResponsesTableData(
      id: serializer.fromJson<int>(json['id']),
      projectId: serializer.fromJson<int>(json['projectId']),
      answersJson: serializer.fromJson<String>(json['answersJson']),
      updatedAt: serializer.fromJson<int>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'projectId': serializer.toJson<int>(projectId),
      'answersJson': serializer.toJson<String>(answersJson),
      'updatedAt': serializer.toJson<int>(updatedAt),
    };
  }

  QuestionnaireResponsesTableData copyWith({
    int? id,
    int? projectId,
    String? answersJson,
    int? updatedAt,
  }) => QuestionnaireResponsesTableData(
    id: id ?? this.id,
    projectId: projectId ?? this.projectId,
    answersJson: answersJson ?? this.answersJson,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  QuestionnaireResponsesTableData copyWithCompanion(
    QuestionnaireResponsesTableCompanion data,
  ) {
    return QuestionnaireResponsesTableData(
      id: data.id.present ? data.id.value : this.id,
      projectId: data.projectId.present ? data.projectId.value : this.projectId,
      answersJson: data.answersJson.present
          ? data.answersJson.value
          : this.answersJson,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('QuestionnaireResponsesTableData(')
          ..write('id: $id, ')
          ..write('projectId: $projectId, ')
          ..write('answersJson: $answersJson, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, projectId, answersJson, updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is QuestionnaireResponsesTableData &&
          other.id == this.id &&
          other.projectId == this.projectId &&
          other.answersJson == this.answersJson &&
          other.updatedAt == this.updatedAt);
}

class QuestionnaireResponsesTableCompanion
    extends UpdateCompanion<QuestionnaireResponsesTableData> {
  final Value<int> id;
  final Value<int> projectId;
  final Value<String> answersJson;
  final Value<int> updatedAt;
  const QuestionnaireResponsesTableCompanion({
    this.id = const Value.absent(),
    this.projectId = const Value.absent(),
    this.answersJson = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  QuestionnaireResponsesTableCompanion.insert({
    this.id = const Value.absent(),
    required int projectId,
    required String answersJson,
    required int updatedAt,
  }) : projectId = Value(projectId),
       answersJson = Value(answersJson),
       updatedAt = Value(updatedAt);
  static Insertable<QuestionnaireResponsesTableData> custom({
    Expression<int>? id,
    Expression<int>? projectId,
    Expression<String>? answersJson,
    Expression<int>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (projectId != null) 'project_id': projectId,
      if (answersJson != null) 'answers_json': answersJson,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  QuestionnaireResponsesTableCompanion copyWith({
    Value<int>? id,
    Value<int>? projectId,
    Value<String>? answersJson,
    Value<int>? updatedAt,
  }) {
    return QuestionnaireResponsesTableCompanion(
      id: id ?? this.id,
      projectId: projectId ?? this.projectId,
      answersJson: answersJson ?? this.answersJson,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (projectId.present) {
      map['project_id'] = Variable<int>(projectId.value);
    }
    if (answersJson.present) {
      map['answers_json'] = Variable<String>(answersJson.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<int>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('QuestionnaireResponsesTableCompanion(')
          ..write('id: $id, ')
          ..write('projectId: $projectId, ')
          ..write('answersJson: $answersJson, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

class $GeneratedSpecsTableTable extends GeneratedSpecsTable
    with TableInfo<$GeneratedSpecsTableTable, GeneratedSpecsTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $GeneratedSpecsTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _projectIdMeta = const VerificationMeta(
    'projectId',
  );
  @override
  late final GeneratedColumn<int> projectId = GeneratedColumn<int>(
    'project_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES projects_table (id)',
    ),
  );
  static const VerificationMeta _versionMeta = const VerificationMeta(
    'version',
  );
  @override
  late final GeneratedColumn<int> version = GeneratedColumn<int>(
    'version',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _contentJsonMeta = const VerificationMeta(
    'contentJson',
  );
  @override
  late final GeneratedColumn<String> contentJson = GeneratedColumn<String>(
    'content_json',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<int> createdAt = GeneratedColumn<int>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    projectId,
    version,
    contentJson,
    createdAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'generated_specs_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<GeneratedSpecsTableData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('project_id')) {
      context.handle(
        _projectIdMeta,
        projectId.isAcceptableOrUnknown(data['project_id']!, _projectIdMeta),
      );
    } else if (isInserting) {
      context.missing(_projectIdMeta);
    }
    if (data.containsKey('version')) {
      context.handle(
        _versionMeta,
        version.isAcceptableOrUnknown(data['version']!, _versionMeta),
      );
    } else if (isInserting) {
      context.missing(_versionMeta);
    }
    if (data.containsKey('content_json')) {
      context.handle(
        _contentJsonMeta,
        contentJson.isAcceptableOrUnknown(
          data['content_json']!,
          _contentJsonMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_contentJsonMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  GeneratedSpecsTableData map(
    Map<String, dynamic> data, {
    String? tablePrefix,
  }) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return GeneratedSpecsTableData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      projectId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}project_id'],
      )!,
      version: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}version'],
      )!,
      contentJson: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}content_json'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $GeneratedSpecsTableTable createAlias(String alias) {
    return $GeneratedSpecsTableTable(attachedDatabase, alias);
  }
}

class GeneratedSpecsTableData extends DataClass
    implements Insertable<GeneratedSpecsTableData> {
  final int id;
  final int projectId;
  final int version;
  final String contentJson;
  final int createdAt;
  const GeneratedSpecsTableData({
    required this.id,
    required this.projectId,
    required this.version,
    required this.contentJson,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['project_id'] = Variable<int>(projectId);
    map['version'] = Variable<int>(version);
    map['content_json'] = Variable<String>(contentJson);
    map['created_at'] = Variable<int>(createdAt);
    return map;
  }

  GeneratedSpecsTableCompanion toCompanion(bool nullToAbsent) {
    return GeneratedSpecsTableCompanion(
      id: Value(id),
      projectId: Value(projectId),
      version: Value(version),
      contentJson: Value(contentJson),
      createdAt: Value(createdAt),
    );
  }

  factory GeneratedSpecsTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return GeneratedSpecsTableData(
      id: serializer.fromJson<int>(json['id']),
      projectId: serializer.fromJson<int>(json['projectId']),
      version: serializer.fromJson<int>(json['version']),
      contentJson: serializer.fromJson<String>(json['contentJson']),
      createdAt: serializer.fromJson<int>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'projectId': serializer.toJson<int>(projectId),
      'version': serializer.toJson<int>(version),
      'contentJson': serializer.toJson<String>(contentJson),
      'createdAt': serializer.toJson<int>(createdAt),
    };
  }

  GeneratedSpecsTableData copyWith({
    int? id,
    int? projectId,
    int? version,
    String? contentJson,
    int? createdAt,
  }) => GeneratedSpecsTableData(
    id: id ?? this.id,
    projectId: projectId ?? this.projectId,
    version: version ?? this.version,
    contentJson: contentJson ?? this.contentJson,
    createdAt: createdAt ?? this.createdAt,
  );
  GeneratedSpecsTableData copyWithCompanion(GeneratedSpecsTableCompanion data) {
    return GeneratedSpecsTableData(
      id: data.id.present ? data.id.value : this.id,
      projectId: data.projectId.present ? data.projectId.value : this.projectId,
      version: data.version.present ? data.version.value : this.version,
      contentJson: data.contentJson.present
          ? data.contentJson.value
          : this.contentJson,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('GeneratedSpecsTableData(')
          ..write('id: $id, ')
          ..write('projectId: $projectId, ')
          ..write('version: $version, ')
          ..write('contentJson: $contentJson, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, projectId, version, contentJson, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is GeneratedSpecsTableData &&
          other.id == this.id &&
          other.projectId == this.projectId &&
          other.version == this.version &&
          other.contentJson == this.contentJson &&
          other.createdAt == this.createdAt);
}

class GeneratedSpecsTableCompanion
    extends UpdateCompanion<GeneratedSpecsTableData> {
  final Value<int> id;
  final Value<int> projectId;
  final Value<int> version;
  final Value<String> contentJson;
  final Value<int> createdAt;
  const GeneratedSpecsTableCompanion({
    this.id = const Value.absent(),
    this.projectId = const Value.absent(),
    this.version = const Value.absent(),
    this.contentJson = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  GeneratedSpecsTableCompanion.insert({
    this.id = const Value.absent(),
    required int projectId,
    required int version,
    required String contentJson,
    required int createdAt,
  }) : projectId = Value(projectId),
       version = Value(version),
       contentJson = Value(contentJson),
       createdAt = Value(createdAt);
  static Insertable<GeneratedSpecsTableData> custom({
    Expression<int>? id,
    Expression<int>? projectId,
    Expression<int>? version,
    Expression<String>? contentJson,
    Expression<int>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (projectId != null) 'project_id': projectId,
      if (version != null) 'version': version,
      if (contentJson != null) 'content_json': contentJson,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  GeneratedSpecsTableCompanion copyWith({
    Value<int>? id,
    Value<int>? projectId,
    Value<int>? version,
    Value<String>? contentJson,
    Value<int>? createdAt,
  }) {
    return GeneratedSpecsTableCompanion(
      id: id ?? this.id,
      projectId: projectId ?? this.projectId,
      version: version ?? this.version,
      contentJson: contentJson ?? this.contentJson,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (projectId.present) {
      map['project_id'] = Variable<int>(projectId.value);
    }
    if (version.present) {
      map['version'] = Variable<int>(version.value);
    }
    if (contentJson.present) {
      map['content_json'] = Variable<String>(contentJson.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<int>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('GeneratedSpecsTableCompanion(')
          ..write('id: $id, ')
          ..write('projectId: $projectId, ')
          ..write('version: $version, ')
          ..write('contentJson: $contentJson, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $UsersTableTable usersTable = $UsersTableTable(this);
  late final $ProjectsTableTable projectsTable = $ProjectsTableTable(this);
  late final $QuestionnaireResponsesTableTable questionnaireResponsesTable =
      $QuestionnaireResponsesTableTable(this);
  late final $GeneratedSpecsTableTable generatedSpecsTable =
      $GeneratedSpecsTableTable(this);
  late final ProjectDao projectDao = ProjectDao(this as AppDatabase);
  late final SpecDao specDao = SpecDao(this as AppDatabase);
  late final QuestionnaireDao questionnaireDao = QuestionnaireDao(
    this as AppDatabase,
  );
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    usersTable,
    projectsTable,
    questionnaireResponsesTable,
    generatedSpecsTable,
  ];
}

typedef $$UsersTableTableCreateCompanionBuilder =
    UsersTableCompanion Function({
      Value<int> id,
      required String firebaseUid,
      required String email,
      required int createdAt,
    });
typedef $$UsersTableTableUpdateCompanionBuilder =
    UsersTableCompanion Function({
      Value<int> id,
      Value<String> firebaseUid,
      Value<String> email,
      Value<int> createdAt,
    });

final class $$UsersTableTableReferences
    extends BaseReferences<_$AppDatabase, $UsersTableTable, UsersTableData> {
  $$UsersTableTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$ProjectsTableTable, List<ProjectsTableData>>
  _projectsTableRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.projectsTable,
    aliasName: $_aliasNameGenerator(db.usersTable.id, db.projectsTable.userId),
  );

  $$ProjectsTableTableProcessedTableManager get projectsTableRefs {
    final manager = $$ProjectsTableTableTableManager(
      $_db,
      $_db.projectsTable,
    ).filter((f) => f.userId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_projectsTableRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$UsersTableTableFilterComposer
    extends Composer<_$AppDatabase, $UsersTableTable> {
  $$UsersTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get firebaseUid => $composableBuilder(
    column: $table.firebaseUid,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get email => $composableBuilder(
    column: $table.email,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> projectsTableRefs(
    Expression<bool> Function($$ProjectsTableTableFilterComposer f) f,
  ) {
    final $$ProjectsTableTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.projectsTable,
      getReferencedColumn: (t) => t.userId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProjectsTableTableFilterComposer(
            $db: $db,
            $table: $db.projectsTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$UsersTableTableOrderingComposer
    extends Composer<_$AppDatabase, $UsersTableTable> {
  $$UsersTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get firebaseUid => $composableBuilder(
    column: $table.firebaseUid,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get email => $composableBuilder(
    column: $table.email,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$UsersTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $UsersTableTable> {
  $$UsersTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get firebaseUid => $composableBuilder(
    column: $table.firebaseUid,
    builder: (column) => column,
  );

  GeneratedColumn<String> get email =>
      $composableBuilder(column: $table.email, builder: (column) => column);

  GeneratedColumn<int> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  Expression<T> projectsTableRefs<T extends Object>(
    Expression<T> Function($$ProjectsTableTableAnnotationComposer a) f,
  ) {
    final $$ProjectsTableTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.projectsTable,
      getReferencedColumn: (t) => t.userId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProjectsTableTableAnnotationComposer(
            $db: $db,
            $table: $db.projectsTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$UsersTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $UsersTableTable,
          UsersTableData,
          $$UsersTableTableFilterComposer,
          $$UsersTableTableOrderingComposer,
          $$UsersTableTableAnnotationComposer,
          $$UsersTableTableCreateCompanionBuilder,
          $$UsersTableTableUpdateCompanionBuilder,
          (UsersTableData, $$UsersTableTableReferences),
          UsersTableData,
          PrefetchHooks Function({bool projectsTableRefs})
        > {
  $$UsersTableTableTableManager(_$AppDatabase db, $UsersTableTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$UsersTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$UsersTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$UsersTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> firebaseUid = const Value.absent(),
                Value<String> email = const Value.absent(),
                Value<int> createdAt = const Value.absent(),
              }) => UsersTableCompanion(
                id: id,
                firebaseUid: firebaseUid,
                email: email,
                createdAt: createdAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String firebaseUid,
                required String email,
                required int createdAt,
              }) => UsersTableCompanion.insert(
                id: id,
                firebaseUid: firebaseUid,
                email: email,
                createdAt: createdAt,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$UsersTableTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({projectsTableRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (projectsTableRefs) db.projectsTable,
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (projectsTableRefs)
                    await $_getPrefetchedData<
                      UsersTableData,
                      $UsersTableTable,
                      ProjectsTableData
                    >(
                      currentTable: table,
                      referencedTable: $$UsersTableTableReferences
                          ._projectsTableRefsTable(db),
                      managerFromTypedResult: (p0) =>
                          $$UsersTableTableReferences(
                            db,
                            table,
                            p0,
                          ).projectsTableRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where((e) => e.userId == item.id),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$UsersTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $UsersTableTable,
      UsersTableData,
      $$UsersTableTableFilterComposer,
      $$UsersTableTableOrderingComposer,
      $$UsersTableTableAnnotationComposer,
      $$UsersTableTableCreateCompanionBuilder,
      $$UsersTableTableUpdateCompanionBuilder,
      (UsersTableData, $$UsersTableTableReferences),
      UsersTableData,
      PrefetchHooks Function({bool projectsTableRefs})
    >;
typedef $$ProjectsTableTableCreateCompanionBuilder =
    ProjectsTableCompanion Function({
      Value<int> id,
      required int userId,
      required String title,
      Value<String?> rawIdea,
      required String status,
      required int createdAt,
    });
typedef $$ProjectsTableTableUpdateCompanionBuilder =
    ProjectsTableCompanion Function({
      Value<int> id,
      Value<int> userId,
      Value<String> title,
      Value<String?> rawIdea,
      Value<String> status,
      Value<int> createdAt,
    });

final class $$ProjectsTableTableReferences
    extends
        BaseReferences<_$AppDatabase, $ProjectsTableTable, ProjectsTableData> {
  $$ProjectsTableTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $UsersTableTable _userIdTable(_$AppDatabase db) =>
      db.usersTable.createAlias(
        $_aliasNameGenerator(db.projectsTable.userId, db.usersTable.id),
      );

  $$UsersTableTableProcessedTableManager get userId {
    final $_column = $_itemColumn<int>('user_id')!;

    final manager = $$UsersTableTableTableManager(
      $_db,
      $_db.usersTable,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_userIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<
    $QuestionnaireResponsesTableTable,
    List<QuestionnaireResponsesTableData>
  >
  _questionnaireResponsesTableRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.questionnaireResponsesTable,
        aliasName: $_aliasNameGenerator(
          db.projectsTable.id,
          db.questionnaireResponsesTable.projectId,
        ),
      );

  $$QuestionnaireResponsesTableTableProcessedTableManager
  get questionnaireResponsesTableRefs {
    final manager = $$QuestionnaireResponsesTableTableTableManager(
      $_db,
      $_db.questionnaireResponsesTable,
    ).filter((f) => f.projectId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _questionnaireResponsesTableRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<
    $GeneratedSpecsTableTable,
    List<GeneratedSpecsTableData>
  >
  _generatedSpecsTableRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.generatedSpecsTable,
        aliasName: $_aliasNameGenerator(
          db.projectsTable.id,
          db.generatedSpecsTable.projectId,
        ),
      );

  $$GeneratedSpecsTableTableProcessedTableManager get generatedSpecsTableRefs {
    final manager = $$GeneratedSpecsTableTableTableManager(
      $_db,
      $_db.generatedSpecsTable,
    ).filter((f) => f.projectId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _generatedSpecsTableRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$ProjectsTableTableFilterComposer
    extends Composer<_$AppDatabase, $ProjectsTableTable> {
  $$ProjectsTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get rawIdea => $composableBuilder(
    column: $table.rawIdea,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  $$UsersTableTableFilterComposer get userId {
    final $$UsersTableTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.userId,
      referencedTable: $db.usersTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsersTableTableFilterComposer(
            $db: $db,
            $table: $db.usersTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> questionnaireResponsesTableRefs(
    Expression<bool> Function(
      $$QuestionnaireResponsesTableTableFilterComposer f,
    )
    f,
  ) {
    final $$QuestionnaireResponsesTableTableFilterComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.questionnaireResponsesTable,
          getReferencedColumn: (t) => t.projectId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$QuestionnaireResponsesTableTableFilterComposer(
                $db: $db,
                $table: $db.questionnaireResponsesTable,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }

  Expression<bool> generatedSpecsTableRefs(
    Expression<bool> Function($$GeneratedSpecsTableTableFilterComposer f) f,
  ) {
    final $$GeneratedSpecsTableTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.generatedSpecsTable,
      getReferencedColumn: (t) => t.projectId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$GeneratedSpecsTableTableFilterComposer(
            $db: $db,
            $table: $db.generatedSpecsTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$ProjectsTableTableOrderingComposer
    extends Composer<_$AppDatabase, $ProjectsTableTable> {
  $$ProjectsTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get rawIdea => $composableBuilder(
    column: $table.rawIdea,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$UsersTableTableOrderingComposer get userId {
    final $$UsersTableTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.userId,
      referencedTable: $db.usersTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsersTableTableOrderingComposer(
            $db: $db,
            $table: $db.usersTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ProjectsTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $ProjectsTableTable> {
  $$ProjectsTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get rawIdea =>
      $composableBuilder(column: $table.rawIdea, builder: (column) => column);

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<int> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  $$UsersTableTableAnnotationComposer get userId {
    final $$UsersTableTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.userId,
      referencedTable: $db.usersTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsersTableTableAnnotationComposer(
            $db: $db,
            $table: $db.usersTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> questionnaireResponsesTableRefs<T extends Object>(
    Expression<T> Function(
      $$QuestionnaireResponsesTableTableAnnotationComposer a,
    )
    f,
  ) {
    final $$QuestionnaireResponsesTableTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.questionnaireResponsesTable,
          getReferencedColumn: (t) => t.projectId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$QuestionnaireResponsesTableTableAnnotationComposer(
                $db: $db,
                $table: $db.questionnaireResponsesTable,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }

  Expression<T> generatedSpecsTableRefs<T extends Object>(
    Expression<T> Function($$GeneratedSpecsTableTableAnnotationComposer a) f,
  ) {
    final $$GeneratedSpecsTableTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.generatedSpecsTable,
          getReferencedColumn: (t) => t.projectId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$GeneratedSpecsTableTableAnnotationComposer(
                $db: $db,
                $table: $db.generatedSpecsTable,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }
}

class $$ProjectsTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ProjectsTableTable,
          ProjectsTableData,
          $$ProjectsTableTableFilterComposer,
          $$ProjectsTableTableOrderingComposer,
          $$ProjectsTableTableAnnotationComposer,
          $$ProjectsTableTableCreateCompanionBuilder,
          $$ProjectsTableTableUpdateCompanionBuilder,
          (ProjectsTableData, $$ProjectsTableTableReferences),
          ProjectsTableData,
          PrefetchHooks Function({
            bool userId,
            bool questionnaireResponsesTableRefs,
            bool generatedSpecsTableRefs,
          })
        > {
  $$ProjectsTableTableTableManager(_$AppDatabase db, $ProjectsTableTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ProjectsTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ProjectsTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ProjectsTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> userId = const Value.absent(),
                Value<String> title = const Value.absent(),
                Value<String?> rawIdea = const Value.absent(),
                Value<String> status = const Value.absent(),
                Value<int> createdAt = const Value.absent(),
              }) => ProjectsTableCompanion(
                id: id,
                userId: userId,
                title: title,
                rawIdea: rawIdea,
                status: status,
                createdAt: createdAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int userId,
                required String title,
                Value<String?> rawIdea = const Value.absent(),
                required String status,
                required int createdAt,
              }) => ProjectsTableCompanion.insert(
                id: id,
                userId: userId,
                title: title,
                rawIdea: rawIdea,
                status: status,
                createdAt: createdAt,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$ProjectsTableTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                userId = false,
                questionnaireResponsesTableRefs = false,
                generatedSpecsTableRefs = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (questionnaireResponsesTableRefs)
                      db.questionnaireResponsesTable,
                    if (generatedSpecsTableRefs) db.generatedSpecsTable,
                  ],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (userId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.userId,
                                    referencedTable:
                                        $$ProjectsTableTableReferences
                                            ._userIdTable(db),
                                    referencedColumn:
                                        $$ProjectsTableTableReferences
                                            ._userIdTable(db)
                                            .id,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (questionnaireResponsesTableRefs)
                        await $_getPrefetchedData<
                          ProjectsTableData,
                          $ProjectsTableTable,
                          QuestionnaireResponsesTableData
                        >(
                          currentTable: table,
                          referencedTable: $$ProjectsTableTableReferences
                              ._questionnaireResponsesTableRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$ProjectsTableTableReferences(
                                db,
                                table,
                                p0,
                              ).questionnaireResponsesTableRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.projectId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (generatedSpecsTableRefs)
                        await $_getPrefetchedData<
                          ProjectsTableData,
                          $ProjectsTableTable,
                          GeneratedSpecsTableData
                        >(
                          currentTable: table,
                          referencedTable: $$ProjectsTableTableReferences
                              ._generatedSpecsTableRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$ProjectsTableTableReferences(
                                db,
                                table,
                                p0,
                              ).generatedSpecsTableRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.projectId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$ProjectsTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ProjectsTableTable,
      ProjectsTableData,
      $$ProjectsTableTableFilterComposer,
      $$ProjectsTableTableOrderingComposer,
      $$ProjectsTableTableAnnotationComposer,
      $$ProjectsTableTableCreateCompanionBuilder,
      $$ProjectsTableTableUpdateCompanionBuilder,
      (ProjectsTableData, $$ProjectsTableTableReferences),
      ProjectsTableData,
      PrefetchHooks Function({
        bool userId,
        bool questionnaireResponsesTableRefs,
        bool generatedSpecsTableRefs,
      })
    >;
typedef $$QuestionnaireResponsesTableTableCreateCompanionBuilder =
    QuestionnaireResponsesTableCompanion Function({
      Value<int> id,
      required int projectId,
      required String answersJson,
      required int updatedAt,
    });
typedef $$QuestionnaireResponsesTableTableUpdateCompanionBuilder =
    QuestionnaireResponsesTableCompanion Function({
      Value<int> id,
      Value<int> projectId,
      Value<String> answersJson,
      Value<int> updatedAt,
    });

final class $$QuestionnaireResponsesTableTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $QuestionnaireResponsesTableTable,
          QuestionnaireResponsesTableData
        > {
  $$QuestionnaireResponsesTableTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $ProjectsTableTable _projectIdTable(_$AppDatabase db) =>
      db.projectsTable.createAlias(
        $_aliasNameGenerator(
          db.questionnaireResponsesTable.projectId,
          db.projectsTable.id,
        ),
      );

  $$ProjectsTableTableProcessedTableManager get projectId {
    final $_column = $_itemColumn<int>('project_id')!;

    final manager = $$ProjectsTableTableTableManager(
      $_db,
      $_db.projectsTable,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_projectIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$QuestionnaireResponsesTableTableFilterComposer
    extends Composer<_$AppDatabase, $QuestionnaireResponsesTableTable> {
  $$QuestionnaireResponsesTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get answersJson => $composableBuilder(
    column: $table.answersJson,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  $$ProjectsTableTableFilterComposer get projectId {
    final $$ProjectsTableTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.projectId,
      referencedTable: $db.projectsTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProjectsTableTableFilterComposer(
            $db: $db,
            $table: $db.projectsTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$QuestionnaireResponsesTableTableOrderingComposer
    extends Composer<_$AppDatabase, $QuestionnaireResponsesTableTable> {
  $$QuestionnaireResponsesTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get answersJson => $composableBuilder(
    column: $table.answersJson,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$ProjectsTableTableOrderingComposer get projectId {
    final $$ProjectsTableTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.projectId,
      referencedTable: $db.projectsTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProjectsTableTableOrderingComposer(
            $db: $db,
            $table: $db.projectsTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$QuestionnaireResponsesTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $QuestionnaireResponsesTableTable> {
  $$QuestionnaireResponsesTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get answersJson => $composableBuilder(
    column: $table.answersJson,
    builder: (column) => column,
  );

  GeneratedColumn<int> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  $$ProjectsTableTableAnnotationComposer get projectId {
    final $$ProjectsTableTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.projectId,
      referencedTable: $db.projectsTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProjectsTableTableAnnotationComposer(
            $db: $db,
            $table: $db.projectsTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$QuestionnaireResponsesTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $QuestionnaireResponsesTableTable,
          QuestionnaireResponsesTableData,
          $$QuestionnaireResponsesTableTableFilterComposer,
          $$QuestionnaireResponsesTableTableOrderingComposer,
          $$QuestionnaireResponsesTableTableAnnotationComposer,
          $$QuestionnaireResponsesTableTableCreateCompanionBuilder,
          $$QuestionnaireResponsesTableTableUpdateCompanionBuilder,
          (
            QuestionnaireResponsesTableData,
            $$QuestionnaireResponsesTableTableReferences,
          ),
          QuestionnaireResponsesTableData,
          PrefetchHooks Function({bool projectId})
        > {
  $$QuestionnaireResponsesTableTableTableManager(
    _$AppDatabase db,
    $QuestionnaireResponsesTableTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$QuestionnaireResponsesTableTableFilterComposer(
                $db: db,
                $table: table,
              ),
          createOrderingComposer: () =>
              $$QuestionnaireResponsesTableTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$QuestionnaireResponsesTableTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> projectId = const Value.absent(),
                Value<String> answersJson = const Value.absent(),
                Value<int> updatedAt = const Value.absent(),
              }) => QuestionnaireResponsesTableCompanion(
                id: id,
                projectId: projectId,
                answersJson: answersJson,
                updatedAt: updatedAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int projectId,
                required String answersJson,
                required int updatedAt,
              }) => QuestionnaireResponsesTableCompanion.insert(
                id: id,
                projectId: projectId,
                answersJson: answersJson,
                updatedAt: updatedAt,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$QuestionnaireResponsesTableTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({projectId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (projectId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.projectId,
                                referencedTable:
                                    $$QuestionnaireResponsesTableTableReferences
                                        ._projectIdTable(db),
                                referencedColumn:
                                    $$QuestionnaireResponsesTableTableReferences
                                        ._projectIdTable(db)
                                        .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$QuestionnaireResponsesTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $QuestionnaireResponsesTableTable,
      QuestionnaireResponsesTableData,
      $$QuestionnaireResponsesTableTableFilterComposer,
      $$QuestionnaireResponsesTableTableOrderingComposer,
      $$QuestionnaireResponsesTableTableAnnotationComposer,
      $$QuestionnaireResponsesTableTableCreateCompanionBuilder,
      $$QuestionnaireResponsesTableTableUpdateCompanionBuilder,
      (
        QuestionnaireResponsesTableData,
        $$QuestionnaireResponsesTableTableReferences,
      ),
      QuestionnaireResponsesTableData,
      PrefetchHooks Function({bool projectId})
    >;
typedef $$GeneratedSpecsTableTableCreateCompanionBuilder =
    GeneratedSpecsTableCompanion Function({
      Value<int> id,
      required int projectId,
      required int version,
      required String contentJson,
      required int createdAt,
    });
typedef $$GeneratedSpecsTableTableUpdateCompanionBuilder =
    GeneratedSpecsTableCompanion Function({
      Value<int> id,
      Value<int> projectId,
      Value<int> version,
      Value<String> contentJson,
      Value<int> createdAt,
    });

final class $$GeneratedSpecsTableTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $GeneratedSpecsTableTable,
          GeneratedSpecsTableData
        > {
  $$GeneratedSpecsTableTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $ProjectsTableTable _projectIdTable(_$AppDatabase db) =>
      db.projectsTable.createAlias(
        $_aliasNameGenerator(
          db.generatedSpecsTable.projectId,
          db.projectsTable.id,
        ),
      );

  $$ProjectsTableTableProcessedTableManager get projectId {
    final $_column = $_itemColumn<int>('project_id')!;

    final manager = $$ProjectsTableTableTableManager(
      $_db,
      $_db.projectsTable,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_projectIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$GeneratedSpecsTableTableFilterComposer
    extends Composer<_$AppDatabase, $GeneratedSpecsTableTable> {
  $$GeneratedSpecsTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get version => $composableBuilder(
    column: $table.version,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get contentJson => $composableBuilder(
    column: $table.contentJson,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  $$ProjectsTableTableFilterComposer get projectId {
    final $$ProjectsTableTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.projectId,
      referencedTable: $db.projectsTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProjectsTableTableFilterComposer(
            $db: $db,
            $table: $db.projectsTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$GeneratedSpecsTableTableOrderingComposer
    extends Composer<_$AppDatabase, $GeneratedSpecsTableTable> {
  $$GeneratedSpecsTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get version => $composableBuilder(
    column: $table.version,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get contentJson => $composableBuilder(
    column: $table.contentJson,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$ProjectsTableTableOrderingComposer get projectId {
    final $$ProjectsTableTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.projectId,
      referencedTable: $db.projectsTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProjectsTableTableOrderingComposer(
            $db: $db,
            $table: $db.projectsTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$GeneratedSpecsTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $GeneratedSpecsTableTable> {
  $$GeneratedSpecsTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get version =>
      $composableBuilder(column: $table.version, builder: (column) => column);

  GeneratedColumn<String> get contentJson => $composableBuilder(
    column: $table.contentJson,
    builder: (column) => column,
  );

  GeneratedColumn<int> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  $$ProjectsTableTableAnnotationComposer get projectId {
    final $$ProjectsTableTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.projectId,
      referencedTable: $db.projectsTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProjectsTableTableAnnotationComposer(
            $db: $db,
            $table: $db.projectsTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$GeneratedSpecsTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $GeneratedSpecsTableTable,
          GeneratedSpecsTableData,
          $$GeneratedSpecsTableTableFilterComposer,
          $$GeneratedSpecsTableTableOrderingComposer,
          $$GeneratedSpecsTableTableAnnotationComposer,
          $$GeneratedSpecsTableTableCreateCompanionBuilder,
          $$GeneratedSpecsTableTableUpdateCompanionBuilder,
          (GeneratedSpecsTableData, $$GeneratedSpecsTableTableReferences),
          GeneratedSpecsTableData,
          PrefetchHooks Function({bool projectId})
        > {
  $$GeneratedSpecsTableTableTableManager(
    _$AppDatabase db,
    $GeneratedSpecsTableTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$GeneratedSpecsTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$GeneratedSpecsTableTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$GeneratedSpecsTableTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> projectId = const Value.absent(),
                Value<int> version = const Value.absent(),
                Value<String> contentJson = const Value.absent(),
                Value<int> createdAt = const Value.absent(),
              }) => GeneratedSpecsTableCompanion(
                id: id,
                projectId: projectId,
                version: version,
                contentJson: contentJson,
                createdAt: createdAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int projectId,
                required int version,
                required String contentJson,
                required int createdAt,
              }) => GeneratedSpecsTableCompanion.insert(
                id: id,
                projectId: projectId,
                version: version,
                contentJson: contentJson,
                createdAt: createdAt,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$GeneratedSpecsTableTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({projectId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (projectId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.projectId,
                                referencedTable:
                                    $$GeneratedSpecsTableTableReferences
                                        ._projectIdTable(db),
                                referencedColumn:
                                    $$GeneratedSpecsTableTableReferences
                                        ._projectIdTable(db)
                                        .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$GeneratedSpecsTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $GeneratedSpecsTableTable,
      GeneratedSpecsTableData,
      $$GeneratedSpecsTableTableFilterComposer,
      $$GeneratedSpecsTableTableOrderingComposer,
      $$GeneratedSpecsTableTableAnnotationComposer,
      $$GeneratedSpecsTableTableCreateCompanionBuilder,
      $$GeneratedSpecsTableTableUpdateCompanionBuilder,
      (GeneratedSpecsTableData, $$GeneratedSpecsTableTableReferences),
      GeneratedSpecsTableData,
      PrefetchHooks Function({bool projectId})
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$UsersTableTableTableManager get usersTable =>
      $$UsersTableTableTableManager(_db, _db.usersTable);
  $$ProjectsTableTableTableManager get projectsTable =>
      $$ProjectsTableTableTableManager(_db, _db.projectsTable);
  $$QuestionnaireResponsesTableTableTableManager
  get questionnaireResponsesTable =>
      $$QuestionnaireResponsesTableTableTableManager(
        _db,
        _db.questionnaireResponsesTable,
      );
  $$GeneratedSpecsTableTableTableManager get generatedSpecsTable =>
      $$GeneratedSpecsTableTableTableManager(_db, _db.generatedSpecsTable);
}
