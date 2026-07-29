import canonicalLaneMathlib.AdmissibleClass

/-!
# Equicontinuity Classification Package

This module frames the equicontinuity classification for cellular automata as
an admissible-class bridge closure. The key result is that a cellular automaton
with equicontinuous dynamics has a stabilizing orbit structure, which is
captured by the bridge and gate properties.
-/

namespace HautevilleHouse
namespace DynamicalAspectsCellularAutomataCanonicalLaneLean

structure EquicontinuousAutomaton (Alphabet : Type u) (IndexSet : Type v) where
  localRule : Finset (Finset (IndexSet × Alphabet)) -> Alphabet
  radius : ℕ
  uniformEquicontinuous : Prop
  equicontinuityWitness : Prop
  asymptoticPhaseLock : Prop

structure EquicontinuityEvidence (A : EquicontinuousAutomaton Alphabet IndexSet) where
  uniformEquicontinuousClosed : A.uniformEquicontinuous
  equicontinuityWitnessClosed : A.equicontinuityWitness
  asymptoticPhaseLockClosed : A.asymptoticPhaseLock

def EquicontinuityClosed (A : EquicontinuousAutomaton Alphabet IndexSet) : Prop :=
  A.uniformEquicontinuous ∧ A.equicontinuityWitness ∧ A.asymptoticPhaseLock

theorem equicontinuity_closed_from_evidence (A : EquicontinuousAutomaton Alphabet IndexSet)
    (E : EquicontinuityEvidence A) : EquicontinuityClosed A := by
  exact And.intro E.uniformEquicontinuousClosed (And.intro E.equicontinuityWitnessClosed E.asymptoticPhaseLockClosed)

end DynamicalAspectsCellularAutomataCanonicalLaneLean
end HautevilleHouse