import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalAspectsCellularAutomataCanonicalLaneLean

structure OmegaLimitSetPackage (S : Type) (CA : CellularAutomaton S ℕ) (C : ConfigSpace S CA) where
  omegaLimit : (ℕ → S) → Set (ℕ → S)
  nonemptiness : Prop
  invariance : Prop
  minimality : Prop
  attraction : Prop

structure LimitSetPackage (S : Type) (CA : CellularAutomaton S ℕ) (C : ConfigSpace S CA) where
  limitSet : Set (ℕ → S)
  closureUnderDynamics : Prop
  containsAllOmegaLimits : Prop
  characterizationViaStronglyTransitive : Prop

structure OmegaLimitEvidence {S : Type} {CA : CellularAutomaton S ℕ} {C : ConfigSpace S CA}
    (P : OmegaLimitSetPackage S CA C) where
  nonemptinessClosed : P.nonemptiness
  invarianceClosed : P.invariance
  minimalityClosed : P.minimality
  attractionClosed : P.attraction

def OmegaLimitClosed {S : Type} {CA : CellularAutomaton S ℕ} {C : ConfigSpace S CA}
    (P : OmegaLimitSetPackage S CA C) : Prop :=
  P.nonemptiness ∧ P.invariance ∧ P.minimality ∧ P.attraction

theorem omega_limit_closed_from_evidence {S : Type} {CA : CellularAutomaton S ℕ} {C : ConfigSpace S CA}
    (P : OmegaLimitSetPackage S CA C) (E : OmegaLimitEvidence P) :
    OmegaLimitClosed P := by
  exact And.intro E.nonemptinessClosed (And.intro E.invarianceClosed (And.intro E.minimalityClosed E.attractionClosed))

end DynamicalAspectsCellularAutomataCanonicalLaneLean
end HautevilleHouse