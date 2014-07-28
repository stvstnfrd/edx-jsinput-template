def vglcfn(e, ans):
  '''
  par is a dictionary containing two keys, "answer" and "state"
  The value of answer is the JSON string returned by getGrade
  The value of state is the JSON string returned by getState
  '''
  par = json.loads(ans)
  # We can use either the value of the answer key to grade
  answer = json.loads(par["answer"])
  return answer["cylinder"] and not answer["cube"]
  '''
  # Or we could use the value of the state key
  state = json.loads(par["state"])
  selectedObjects = state["selectedObjects"]
  return selectedObjects["cylinder"] and not selectedObjects["cube"]
  '''

