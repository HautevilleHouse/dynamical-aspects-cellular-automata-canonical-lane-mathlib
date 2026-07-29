import canonicalLaneMathlib.AdmissibleClass

/-!
# Topological Entropy Classification Package

This module encodes topological entropy as an admissible-class closure.
A cellular automaton with positive topological entropy exhibits sensitive
dependence on initial conditions, and the entropy value itself provides a
bridge between the dynamical system and the admissible class structure.
-/

namespace HautevilleHouse
namespace DynamicalAspectsCellularAutomataCanonicalLaneLean

structure TopologicalEntropyAutomaton (Alphabet : Type u) (IndexSet : Type v) where
  localRule : Finset (Finset (IndexSet × Alphabet)) -> Alphabet
  radius : ℕ
  topologicalEntropy : ℝ
  entropyPositive : Prop
  mixingProperties : Prop

structure TopologicalEntropyEvidence (A : TopologicalEntropyAutomaton Alphabet IndexSet) where
  topologicalEntropyClosed : A.topologicalEntropy > 0
  mixingPropertiesClosed : A.mixingProperties

def TopologicalEntropyClosed (A : TopologicalEntropyAutomaton Alphabet IndexSet) : Prop :=
  A.topologicalEntropy > 0 ∧ A.mixingProperties

theorem topological_entropy_closed_from_evidence (A : TopologicalEntropyAutomaton Alphabet IndexSet)
    (E : TopologicalEntropyEvidence A) : TopologicalEntropyClosed A := by
  exact And.intro E.topologicalEntropyClosed E.mixingPropertiesClosed

end DynamicalAspectsCellularAutomataCanonicalLaneLean
end HautevilleHouse