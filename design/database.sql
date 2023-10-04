CREATE TABLE
    users (
        id TEXT PRIMARY KEY,
        user_name TEXT,
        password_hash TEXT,
        created_at TIMESTAMP
    );

CREATE TABLE
    roles (
        id TEXT PRIMARY KEY,
        role_name TEXT,
        role_type TEXT CHECK (
            role_type IN ('lecturer', 'student')
        ),
        role_title TEXT,
        created_at TIMESTAMP
    );

CREATE TABLE
    role_users (
        role_id TEXT,
        user_id TEXT,
        created_at TIMESTAMP,
        FOREIGN KEY(role_id) REFERENCES roles(id),
        FOREIGN KEY(user_id) REFERENCES users(id)
    );

CREATE TABLE
    courses (
        id TEXT PRIMARY KEY,
        course_name TEXT,
        created_at TIMESTAMP,
        start_at TEXT,
        end_at TEXT,
        weekend TEXT,
        description TEXT,
        lecturer_id TEXT,
        FOREIGN KEY(lecturer_id) REFERENCES users(id)
    );

CREATE TABLE
    course_users (
        id TEXT PRIMARY KEY,
        course_id TEXT,
        user_id TEXT,
        created_at TIMESTAMP,
        FOREIGN KEY(course_id) REFERENCES courses(id),
        FOREIGN KEY(user_id) REFERENCES users(id)
    );