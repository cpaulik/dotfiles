import os

clipboard = os.environ['ESPANSO_CLIPBOARD']
if "slack.com" in clipboard:
    print(f"[this slack thread]({clipboard})")
elif "https://hello.planet.com/jira/browse/" in clipboard:
    issue_number = os.path.split(clipboard)[1]
    if '?' in issue_number:
        issue_number, url_arguments = issue_number.split('?')

    print(f"[{issue_number}]({clipboard})")
elif "hello.planet.com/jira" in clipboard:
    print(f"[in jira]({clipboard})")
else:
    print(f"[$|$]({clipboard})")

