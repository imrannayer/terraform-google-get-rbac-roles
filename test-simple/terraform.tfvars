/**
 * Copyright 2020 Google LLC
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

## Replace with your project id
project_id = "MY-TEST-PROJECT_ID"

## Replace your group/user/service accounts email
groups_users_roles_needed = {
  "group:test-grp-01@example.com" = ["dba"]
  "group:test-grp-02@example.com" = ["developer"]
  "group:test-grp-03@example.com" = ["viewer", "support"]
}
