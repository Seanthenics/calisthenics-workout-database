-- 1. INSERT RECORDS INTO SKILLS

INSERT INTO skills (skill_id, skill_name, difficulty_level, description) VALUES
(1, 'Front Lever', 'Advanced', 'A horizontal pulling skill performed while keeping the body straight.'),
(2, 'Back Lever', 'Advanced', 'A static skill where the body is held horizontally facing downward.'),
(3, 'Planche', 'Advanced', 'A pushing skill where the body is held horizontally above the hands.'),
(4, 'Handstand', 'Intermediate', 'A balance skill performed while supporting the body on the hands.'),
(5, 'Muscle Up', 'Advanced', 'A pulling and pushing movement that transitions from below to above a bar.');


-- 2. INSERT RECORDS INTO SKILL PROGRESSIONS

INSERT INTO skill_progressions 
(progression_id, skill_id, progression_name, level_order, description) VALUES
(1, 1, 'Tuck Front Lever', 1, 'Beginner front lever progression using a tucked position.'),
(2, 1, 'Advanced Tuck Front Lever', 2, 'Front lever progression with a more open hip position.'),
(3, 1, 'One Leg Front Lever', 3, 'One leg is extended while the other remains tucked.'),
(4, 1, 'Straddle Front Lever', 4, 'Both legs are extended outward in a straddle position.'),
(5, 2, 'Tuck Back Lever', 1, 'Beginner back lever progression using a tucked position.'),
(6, 2, 'Advanced Tuck Back Lever', 2, 'Back lever progression with a more open body position.'),
(7, 3, 'Tuck Planche', 1, 'Beginner planche progression with knees tucked toward the chest.'),
(8, 3, 'Advanced Tuck Planche', 2, 'Planche progression with a more extended body position.'),
(9, 4, 'Wall Handstand', 1, 'Handstand practice using a wall for support.'),
(10, 4, 'Freestanding Handstand', 2, 'Handstand performed without wall support.'),
(11, 5, 'Assisted Muscle Up', 1, 'Muscle up practice using assistance.'),
(12, 5, 'Strict Muscle Up', 2, 'Muscle up performed without assistance or excessive swinging.');


-- 3. INSERT RECORDS INTO EXERCISES

INSERT INTO exercises 
(exercise_id, exercise_name, muscle_group, difficulty_level, description) VALUES
(1, 'Pull Ups', 'Back and Biceps', 'Intermediate', 'Vertical pulling exercise using a pull-up bar.'),
(2, 'Australian Rows', 'Back and Biceps', 'Beginner', 'Horizontal pulling exercise performed with a low bar.'),
(3, 'Hollow Body Hold', 'Core', 'Beginner', 'Core exercise that develops body tension.'),
(4, 'Tuck Front Lever Hold', 'Back and Core', 'Advanced', 'Static hold using a tucked front lever position.'),
(5, 'Straight Arm Scapular Pulls', 'Back and Shoulders', 'Intermediate', 'Exercise for developing straight-arm pulling strength.'),
(6, 'Dips', 'Chest and Triceps', 'Intermediate', 'Pushing exercise performed on parallel bars.'),
(7, 'Pike Push Ups', 'Shoulders and Triceps', 'Intermediate', 'Vertical pushing exercise for shoulder strength.'),
(8, 'Handstand Hold', 'Shoulders and Core', 'Advanced', 'Static handstand balance exercise.'),
(9, 'Explosive Pull Ups', 'Back and Biceps', 'Advanced', 'Explosive pulling exercise used to develop pulling power.'),
(10, 'Muscle Up', 'Back, Chest and Triceps', 'Advanced', 'Combined pulling and pushing movement over a bar.');


-- 4. INSERT RECORDS INTO PROGRESSION_EXERCISES

INSERT INTO progression_exercises 
(progression_id, exercise_id, sets, reps, rest_seconds) VALUES
(1, 1, 4, 6, 120),
(1, 3, 3, 30, 60),
(2, 4, 4, 10, 120),
(3, 5, 4, 8, 120),
(4, 5, 4, 10, 120),
(5, 2, 4, 8, 90),
(6, 5, 4, 8, 120),
(7, 7, 4, 8, 120),
(8, 7, 4, 10, 120),
(9, 8, 4, 30, 90),
(11, 9, 5, 3, 120),
(12, 10, 5, 3, 180);


-- 5. INSERT RECORDS INTO PROGRAMS

INSERT INTO programs 
(program_id, program_name, skill_id, difficulty_level, duration_weeks, description) VALUES
(1, 'Front Lever Mastery Program', 1, 'Advanced', 8, 'Eight-week program focused on front lever development.'),
(2, 'Back Lever Strength Program', 2, 'Advanced', 6, 'Six-week program for developing back lever strength.'),
(3, 'Planche Progression Program', 3, 'Advanced', 10, 'Ten-week program focused on planche progression.'),
(4, 'Handstand Balance Program', 4, 'Intermediate', 6, 'Six-week program for improving handstand balance.'),
(5, 'Muscle Up Program', 5, 'Advanced', 8, 'Eight-week program focused on muscle up strength and technique.');


-- 6. INSERT RECORDS INTO PROGRAM_SCHEDULE

INSERT INTO program_schedule 
(schedule_id, program_id, week_number, day_number, workout_name) VALUES
(1, 1, 1, 1, 'Front Lever Pull Day'),
(2, 1, 1, 2, 'Core and Front Lever'),
(3, 1, 2, 1, 'Front Lever Strength'),
(4, 1, 2, 2, 'Pulling Strength'),
(5, 2, 1, 1, 'Back Lever Training'),
(6, 2, 1, 2, 'Back and Core'),
(7, 3, 1, 1, 'Planche Push Day'),
(8, 4, 1, 1, 'Handstand Practice'),
(9, 5, 1, 1, 'Muscle Up Pull Day'),
(10, 5, 1, 2, 'Muscle Up Technique');


-- 7. INSERT RECORDS INTO SCHEDULE_EXERCISES

INSERT INTO schedule_exercises 
(schedule_id, exercise_id, order_in_workout, sets, reps, rest_seconds) VALUES
(1, 1, 1, 4, 6, 120),
(1, 4, 2, 4, 10, 120),
(2, 3, 1, 3, 30, 60),
(3, 5, 1, 4, 8, 120),
(4, 1, 1, 4, 8, 120),
(5, 2, 1, 4, 8, 90),
(6, 3, 1, 3, 30, 60),
(7, 7, 1, 4, 8, 120),
(8, 8, 1, 4, 30, 90),
(9, 9, 1, 5, 3, 120);


-- 8. INSERT RECORDS INTO USERS

INSERT INTO users 
(user_id, full_name, email, experience_level, join_date) VALUES
(1, 'Juan Dela Cruz', 'juan@example.com', 'Beginner', '2026-01-15'),
(2, 'Maria Santos', 'maria@example.com', 'Intermediate', '2026-02-10'),
(3, 'Carlo Reyes', 'carlo@example.com', 'Advanced', '2026-03-05'),
(4, 'Ana Garcia', 'ana@example.com', 'Intermediate', '2026-03-20'),
(5, 'Mark Villanueva', 'mark@example.com', 'Advanced', '2026-04-12');


-- 9. INSERT RECORDS INTO USER_ENROLLMENTS

INSERT INTO user_enrollments 
(enrollment_id, user_id, program_id, start_date, status) VALUES
(1, 1, 1, '2026-05-01', 'Active'),
(2, 1, 5, '2026-06-01', 'Active'),
(3, 2, 4, '2026-05-05', 'Active'),
(4, 2, 1, '2026-06-10', 'Completed'),
(5, 3, 3, '2026-05-15', 'Active'),
(6, 3, 5, '2026-06-15', 'Active'),
(7, 4, 4, '2026-06-01', 'Active'),
(8, 4, 2, '2026-06-20', 'Active'),
(9, 5, 1, '2026-05-20', 'Completed'),
(10, 5, 3, '2026-06-25', 'Active');


-- 10. INSERT RECORDS INTO USER_PROGRESS

INSERT INTO user_progress 
(progress_id, user_id, progression_id, date_achieved, notes) VALUES
(1, 1, 1, '2026-05-15', 'Successfully held tuck front lever for 10 seconds.'),
(2, 1, 2, '2026-06-20', 'Improved body position and control.'),
(3, 2, 9, '2026-05-20', 'Completed wall handstand for 30 seconds.'),
(4, 2, 10, '2026-06-25', 'Started practicing freestanding handstand.'),
(5, 3, 7, '2026-05-30', 'Held tuck planche for 8 seconds.'),
(6, 3, 8, '2026-06-30', 'Improved advanced tuck planche hold.'),
(7, 4, 11, '2026-06-15', 'Completed assisted muscle ups.'),
(8, 4, 12, '2026-07-05', 'Completed first strict muscle up.'),
(9, 5, 3, '2026-06-10', 'Achieved one-leg front lever.'),
(10, 5, 4, '2026-07-01', 'Started straddle front lever training.');


-- 11. INSERT RECORDS INTO WORKOUT_LOGS

INSERT INTO workout_logs 
(log_id, user_id, schedule_id, workout_date, duration_minutes, notes) VALUES
(1, 1, 1, '2026-07-01', 60, 'Good front lever session.'),
(2, 1, 2, '2026-07-03', 45, 'Focused on core strength.'),
(3, 2, 8, '2026-07-02', 50, 'Handstand balance practice.'),
(4, 2, 3, '2026-07-05', 55, 'Front lever strength training.'),
(5, 3, 7, '2026-07-04', 65, 'Planche pushing session.'),
(6, 3, 9, '2026-07-06', 60, 'Explosive pull up training.'),
(7, 4, 9, '2026-07-07', 50, 'Muscle up strength work.'),
(8, 4, 10, '2026-07-09', 45, 'Muscle up technique practice.'),
(9, 5, 1, '2026-07-08', 70, 'Front lever training.'),
(10, 5, 3, '2026-07-10', 65, 'Advanced pulling session.');